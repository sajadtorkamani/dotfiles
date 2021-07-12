<?php

/**
 * Symlink aliases from `aliases/` directory into the `~/oh-my-zsh/custom/` directory.
 */
function symlinkAliases(): void
{
    $aliasesDir = ROOT_PATH . '/aliases';
    $aliasFiles = array_diff(scandir($aliasesDir), ['.', '..']);

    foreach ($aliasFiles as $aliasFile) {
        $src = $aliasesDir . '/' . $aliasFile;
        $dest = $_SERVER['HOME'] . '/.oh-my-zsh/custom/' . $aliasFile;

        if (file_exists($dest)) {
            echo "Skipping: $dest already exists" . PHP_EOL;
        } else {
            symlink($src, $dest);
            echo "Aliases added: $aliasFile" . PHP_EOL;
        }
    }
}
