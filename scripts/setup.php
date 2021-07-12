<?php
#!/usr/bin/env php

require_once '../vendor/autoload.php';

define('ROOT_PATH', dirname(__FILE__, 2));
define('IS_LINUX', PHP_OS_FAMILY === 'Linux');
define('IS_MAC', PHP_OS_FAMILY === 'Darwin');

require_once 'clone_vim_packages.php';
require_once 'symlink_aliases.php';
require_once 'symlink_dotfiles.php';
require_once 'symlink_ssh_config.php';

cloneVimPackages();
symlinkAliases();
symlinkDotfiles();
symlinkSshConfig();
