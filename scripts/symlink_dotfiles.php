<?php
#!/usr/bin/env php

$dotfiles = ['.gitignore_global', '.vim', '.vimrc', '.zshrc'];

foreach ($dotfiles as $dotfile) {
    $src = dirname(__FILE__, 2) . '/' . $dotfile;
    $dest = $_SERVER['HOME'] . '/' . $dotfile;

    if (file_exists($dest)) {
        echo "Skipped: $dest already exists" . PHP_EOL;
    } else {
        symlink($src, $dest);
        echo "Symlinked: $dest points to $src" . PHP_EOL;
    }
}
