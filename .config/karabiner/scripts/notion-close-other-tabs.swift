// Close every tab in the focused Notion window except the active one, by opening the
// active tab's right-click menu and pressing "Close Other Tabs" (Notion has no shortcut for it).
// The active tab is the one whose title matches the window title.
// Pass --dry-run to open the menu and print what would be pressed, then dismiss it.
import AppKit
import ApplicationServices

let isDryRun = CommandLine.arguments.contains("--dry-run")

func fail(_ message: String) -> Never {
    FileHandle.standardError.write(Data("notion-close-other-tabs: \(message)\n".utf8))
    NSSound.beep()
    exit(1)
}

func attribute(_ element: AXUIElement, _ name: String) -> AnyObject? {
    var value: AnyObject?
    AXUIElementCopyAttributeValue(element, name as CFString, &value)
    return value
}

func children(of element: AXUIElement) -> [AXUIElement] {
    attribute(element, kAXChildrenAttribute) as? [AXUIElement] ?? []
}

func role(of element: AXUIElement) -> String? {
    attribute(element, kAXRoleAttribute) as? String
}

func title(of element: AXUIElement) -> String {
    attribute(element, kAXTitleAttribute) as? String ?? ""
}

func findFirst(in element: AXUIElement, where matches: (AXUIElement) -> Bool) -> AXUIElement? {
    if matches(element) { return element }
    for child in children(of: element) {
        if let match = findFirst(in: child, where: matches) { return match }
    }
    return nil
}

func findAll(in element: AXUIElement, where matches: (AXUIElement) -> Bool) -> [AXUIElement] {
    (matches(element) ? [element] : []) + children(of: element).flatMap { findAll(in: $0, where: matches) }
}

guard AXIsProcessTrusted() else { fail("not trusted for Accessibility") }
guard let notion = NSRunningApplication.runningApplications(withBundleIdentifier: "notion.id").first else {
    fail("Notion is not running")
}

let application = AXUIElementCreateApplication(notion.processIdentifier)
// Electron only builds its accessibility tree once asked to.
AXUIElementSetAttributeValue(application, "AXManualAccessibility" as CFString, kCFBooleanTrue)

guard let window = attribute(application, kAXFocusedWindowAttribute) as! AXUIElement? else { fail("no focused window") }
guard let tabBar = findFirst(in: window, where: { role(of: $0) == "AXWebArea" && title(of: $0) == "Tab Bar" }) else {
    fail("tab bar not found")
}

let windowTitle = title(of: window)
let activeTabCandidates = findAll(in: tabBar, where: { role(of: $0) == "AXButton" && title(of: $0) == windowTitle })
guard activeTabCandidates.count == 1, let activeTab = activeTabCandidates.first else {
    fail("expected 1 tab titled \"\(windowTitle)\", found \(activeTabCandidates.count)")
}

AXUIElementPerformAction(activeTab, kAXShowMenuAction as CFString)

var contextMenu: AXUIElement?
for _ in 0..<20 where contextMenu == nil {
    Thread.sleep(forTimeInterval: 0.05)
    contextMenu = children(of: window).first { role(of: $0) == "AXMenu" }
}
guard let contextMenu else { fail("tab menu did not open") }

let closeOtherTabsItem = children(of: contextMenu).first { title(of: $0) == "Close Other Tabs" }
let isEnabled = closeOtherTabsItem.map { attribute($0, kAXEnabledAttribute) as? Bool ?? false } ?? false

if isDryRun || !isEnabled {
    print(isEnabled ? "Would press Close Other Tabs on \"\(windowTitle)\"" : "Close Other Tabs is unavailable (nothing to close)")
    AXUIElementPerformAction(contextMenu, kAXCancelAction as CFString)
} else if let closeOtherTabsItem {
    AXUIElementPerformAction(closeOtherTabsItem, kAXPressAction as CFString)
}
