<?php
#!/usr/bin/env php

require_once 'clone_vim_packages.php';
require_once 'symlink_dotfiles.php';
require_once 'symlink_aliases.php';
require_once 'symlink_ssh_config.php';

cloneVimPackages();
symlinkAliases();
symlinkDotfiles();
symlinkSshConfig();
