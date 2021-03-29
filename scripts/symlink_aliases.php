<?php
#!/usr/bin/env php

$aliasesDir = dirname(__FILE__, 2) . '/aliases';
$aliases = array_diff(scandir($aliasesDir), ['.', '..']);

foreach ($aliases as $alias) {
    $src = $aliasesDir . '/' . $alias;
    $dest = $_SERVER['HOME'] . '/.oh-my-zsh/custom/' . $alias;

    if (file_exists($dest)) {
        echo "Skipping: $dest already exists" . PHP_EOL;
    } else {
        symlink($src, $dest);
        echo "Aliases added: $alias";
    }
}
