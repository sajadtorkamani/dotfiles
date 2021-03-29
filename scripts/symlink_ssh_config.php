<?php

function symlinkSshConfig()
{
    $target = ROOT_PATH . '/ssh_config';
    $link = $_SERVER['HOME'] . '/.ssh/config';

    if (file_exists($link)) {
        echo "Skipped: $link already exists" . PHP_EOL;
    } else {
        symlink($target, $link);
        echo "Symlinked: $link points to $target" . PHP_EOL;
    }
}
