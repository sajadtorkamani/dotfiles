package main

import (
	"fmt"
	"os"
	"path/filepath"
)

func symlinkDotfiles() {
	dotfiles := []string{
		".gitignore_global",
		".rspec",
		".tmux.conf",
		".vim",
		".vimrc",
		".zshrc",
		".ideavimrc",
		".inputrc",
		"deno.json",
		".config/herdr/config.toml",
		".config/herdr/scripts",
	}

	for _, dotfile := range dotfiles {
		target := filepath.Join(rootPath, dotfile)
		link := filepath.Join(homePath, dotfile)

		if pathExists(link) {
			fmt.Printf("Skipped: %s already exists\n", link)
			continue
		}

		if err := os.MkdirAll(filepath.Dir(link), 0755); err != nil {
			fmt.Fprintf(os.Stderr, "Failed to create %s: %v\n", filepath.Dir(link), err)
			continue
		}

		if err := os.Symlink(target, link); err != nil {
			fmt.Fprintf(os.Stderr, "Failed to symlink %s: %v\n", link, err)
			continue
		}

		fmt.Printf("Symlinked: %s points to %s\n", link, target)
	}
}
