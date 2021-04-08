<?php

function cloneVimPackages(): void
{
    foreach (getRepoUrls() as $repoUrl) {
        $repoName = getRepoNameFromUrl($repoUrl);
        $dest = getClonePath($repoName);

        if (file_exists($dest)) {
            echo "Skipping: $dest already exists" . PHP_EOL;
        } else {
            echo exec("git clone $repoUrl $dest");
            echo "Cloned: $repoName to $dest" . PHP_EOL;
        }
    }
}

function getRepoUrls(): array
{
    return [
        'https://github.com/jiangmiao/auto-pairs',
        'https://github.com/ctrlpvim/ctrlp.vim',
        'https://github.com/preservim/nerdtree',
        'https://github.com/vim-airline/vim-airline',
        'https://github.com/prettier/vim-prettier',
        'https://github.com/vim-syntastic/syntastic'
    ];
}

function getRepoNameFromUrl(string $repoUrl): string
{
    $urlParts = explode('/', $repoUrl);
    return end($urlParts);
}

function getClonePath(string $repoName): string
{
    return ROOT_PATH . '/.vim/pack/plugins/start/' . $repoName;
}

