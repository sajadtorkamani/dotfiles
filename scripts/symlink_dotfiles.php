<?php

function symlinkDotfiles()
{
    $dotfiles = [
        '.gitignore_global',
        '.rspec',
        '.tmux.conf',
        '.vim',
        '.vimrc',
        '.zshrc',
        '.ideavimrc',
        'deno.json'
    ];

    foreach ($dotfiles as $dotfile) {
        $target = ROOT_PATH . '/' . $dotfile;
        $link = $_SERVER['HOME'] . '/' . $dotfile;

        if (file_exists($link)) {
            echo "Skipped: $link already exists" . PHP_EOL;
        }
        else {
            symlink($target, $link);
            echo "Symlinked: $link points to $target" . PHP_EOL;
        }
    }
}
