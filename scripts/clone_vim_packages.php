<?php
#!/usr/bin/env php

$repoUrls = [
    'https://github.com/jiangmiao/auto-pairs',
    'https://github.com/ctrlpvim/ctrlp.vim',
    'https://github.com/preservim/nerdtree',
    'https://github.com/vim-airline/vim-airline',
    'https://github.com/prettier/vim-prettier',
    'https://github.com/vim-syntastic/syntastic'
];

function getRepoName(string $repoUrl): string
{
    $urlParts = explode('/', $repoUrl);
    return end($urlParts);
}

function getClonePath(string $repoName): string
{
    return __DIR__ . '/../.vim/pack/plugins/start/' . $repoName;
}

foreach ($repoUrls as $repoUrl) {
    $repoName = getRepoName($repoUrl);
    $dest = getClonePath($repoName);

    if (file_exists($dest)) {
        echo "Skipping: $dest already exists" . PHP_EOL;
    } else {
        echo exec("git clone $repoUrl $dest");
        echo "Cloned: $repoName to $dest" . PHP_EOL;
    }
}

