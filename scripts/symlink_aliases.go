package main

import (
	"fmt"
	"os"
	"path/filepath"
)

// symlinkAliases symlinks aliases from `aliases/` directory into the `~/oh-my-zsh/custom/`
// directory.
func symlinkAliases() {
	aliasesDir := filepath.Join(rootPath, "aliases")

	aliasEntries, err := os.ReadDir(aliasesDir)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Failed to read %s: %v\n", aliasesDir, err)
		return
	}

	for _, aliasEntry := range aliasEntries {
		aliasFile := aliasEntry.Name()

		if aliasFile == ".idea" {
			continue
		}

		source := filepath.Join(aliasesDir, aliasFile)
		destination := filepath.Join(homePath, ".oh-my-zsh/custom", aliasFile)

		if pathExists(destination) {
			fmt.Printf("Skipping: %s already exists\n", destination)
			continue
		}

		if err := os.Symlink(source, destination); err != nil {
			fmt.Fprintf(os.Stderr, "Failed to symlink %s: %v\n", destination, err)
			continue
		}

		fmt.Printf("Aliases added: %s\n", aliasFile)
	}
}
