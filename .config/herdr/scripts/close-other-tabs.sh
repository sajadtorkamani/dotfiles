#!/usr/bin/env bash
# Close every tab in the focused herdr workspace except the active one.
# Pass --dry-run to print the tabs that would be closed without closing them.
set -euo pipefail

herdr_binary="${HERDR_BIN_PATH:-herdr}"

focused_workspace=$("$herdr_binary" workspace list | jq -r '.result.workspaces[] | select(.focused)')
workspace_id=$(jq -r '.workspace_id' <<<"$focused_workspace")
active_tab_id=$(jq -r '.active_tab_id' <<<"$focused_workspace")

"$herdr_binary" tab list --workspace "$workspace_id" \
  | jq -r --arg active_tab_id "$active_tab_id" '.result.tabs[] | select(.tab_id != $active_tab_id) | .tab_id' \
  | while read -r tab_id; do
      if [[ "${1:-}" == "--dry-run" ]]; then
        echo "Would close $tab_id"
      else
        "$herdr_binary" tab close "$tab_id" >/dev/null
      fi
    done
