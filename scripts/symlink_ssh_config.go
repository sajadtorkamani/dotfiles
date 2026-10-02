package main

import (
	"fmt"
	"os"
	"path/filepath"
)

// Deprecated: Not using this at the moment.
func symlinkSshConfig() {
	target := getSshConfig()
	link := filepath.Join(homePath, ".ssh/config")

	if pathExists(link) {
		fmt.Printf("Skipped: %s already exists\n", link)
		return
	}

	if err := os.Symlink(target, link); err != nil {
		fmt.Fprintf(os.Stderr, "Failed to symlink %s: %v\n", link, err)
		return
	}

	fmt.Printf("Symlinked: %s points to %s\n", link, target)
}

func getSshConfig() string {
	file := "ssh_config.linux"

	if isMac {
		file = "ssh_config.mac"
	}

	return filepath.Join(rootPath, file)
}
