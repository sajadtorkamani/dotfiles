<?php

// Depreceated: Not using this at the moment.
function symlinkSshConfig()
{
    $target = getSshConfig();
    $link = $_SERVER['HOME'] . '/.ssh/config';

    if (file_exists($link)) {
        echo "Skipped: $link already exists" . PHP_EOL;
    } else {
        symlink($target, $link);
        echo "Symlinked: $link points to $target" . PHP_EOL;
    }
}

function getSshConfig(): string {
    $file =  IS_MAC ? 'ssh_config.mac' : 'ssh_config.linux';
    return ROOT_PATH . '/' . $file;
}
