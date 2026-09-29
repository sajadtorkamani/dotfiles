package main

import (
	"fmt"
	"os"
	"os/exec"
	"path"
	"path/filepath"
)

func cloneVimPackages() {
	for _, repoUrl := range getRepoUrls() {
		repoName := getRepoNameFromUrl(repoUrl)
		destination := getClonePath(repoName)

		if pathExists(destination) {
			fmt.Printf("Skipping: %s already exists\n", destination)
			continue
		}

		cloneCommand := exec.Command("git", "clone", repoUrl, destination)
		cloneCommand.Stdout = os.Stdout
		cloneCommand.Stderr = os.Stderr

		if err := cloneCommand.Run(); err != nil {
			fmt.Fprintf(os.Stderr, "Failed to clone %s: %v\n", repoName, err)
			continue
		}

		fmt.Printf("Cloned: %s to %s\n", repoName, destination)
	}
}

func getRepoUrls() []string {
	return []string{
		"https://github.com/jiangmiao/auto-pairs",
		"https://github.com/ctrlpvim/ctrlp.vim",
		"https://github.com/preservim/nerdtree",
		"https://github.com/vim-airline/vim-airline",
		"https://github.com/prettier/vim-prettier",
		"https://github.com/vim-syntastic/syntastic",
	}
}

func getRepoNameFromUrl(repoUrl string) string {
	return path.Base(repoUrl)
}

func getClonePath(repoName string) string {
	return filepath.Join(rootPath, ".vim/pack/plugins/start", repoName)
}
