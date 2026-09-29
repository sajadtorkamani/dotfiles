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
        '.inputrc',
        'deno.json',
        '.config/herdr/config.toml',
        '.config/herdr/scripts'
    ];

    foreach ($dotfiles as $dotfile) {
        $target = ROOT_PATH . '/' . $dotfile;
        $link = $_SERVER['HOME'] . '/' . $dotfile;

        if (file_exists($link)) {
            echo "Skipped: $link already exists" . PHP_EOL;
        }
        else {
            $linkDirectory = dirname($link);

            if (!is_dir($linkDirectory)) {
                mkdir($linkDirectory, 0755, true);
            }

            symlink($target, $link);
            echo "Symlinked: $link points to $target" . PHP_EOL;
        }
    }
}
