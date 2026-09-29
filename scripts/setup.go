package main

import (
	"os"
	"path/filepath"
	"runtime"
)

var (
	rootPath = getRootPath()
	homePath = os.Getenv("HOME")
	isLinux  = runtime.GOOS == "linux"
	isMac    = runtime.GOOS == "darwin"
)

func main() {
	cloneVimPackages()
	symlinkAliases()
	symlinkDotfiles()
}

// getRootPath returns the dotfiles repo root, i.e. the parent of the directory containing this
// source file. This works with `go run` because the source path is recorded at compile time.
func getRootPath() string {
	_, currentFile, _, _ := runtime.Caller(0)
	return filepath.Dir(filepath.Dir(currentFile))
}

// pathExists reports whether path exists, counting a broken symlink as existing so it's skipped
// rather than failing when a new symlink is created over it.
func pathExists(path string) bool {
	_, err := os.Lstat(path)
	return err == nil
}
