alias dcc="docker restart memcached"

function rsp() {
  dc exec php ./bin/console app:reset-roles-and-permissions --summary &&
    dc exec php ./bin/console c:c
}

# Run specific PHPUnit tests inside Docker Composer service
function dtf() {
  if [ -z "$1" ]; then
    echo "Please provide a test filter"
    return
  fi

  dce php /bin/bash -c "
    ./clear-test-db.sh &&
    export SYMFONY_DEPRECATIONS_HELPER=weak &&
    php -d memory_limit=3072M ./vendor/bin/phpunit  --stop-on-failure  --filter $1
  "
}

# Run specific PHPUnit tests inside Docker Composer service
function dtfx() {
  if [ -z "$1" ]; then
    echo "Please provide a test filter"
    return
  fi

  dce php /bin/bash -c "
    export SYMFONY_DEPRECATIONS_HELPER=weak &&
    php -d memory_limit=3072M ./vendor/bin/phpunit  --stop-on-failure  --filter $1
  "
}

function dtfa {
  if [ -z "$1" ]; then
    echo "Please provide a test filter"
    return
  fi

  dce php /bin/bash -c "
    export SYMFONY_DEPRECATIONS_HELPER=weak &&
    php -d memory_limit=3072M ./vendor/bin/phpunit   --filter $1
  "
}

function pst() {
  dce php /bin/bash -c "
    php -d memory_limit=3072M ./vendor/bin/phpstan analyse $1
  "
}

function ctd() {
  dce php /bin/bash -c "./clear-test-db.sh"
}

# Run all PHPUnit tests inside Docker Composer service
function dta() {
  dce php /bin/bash -c "./test-parallel.sh"
}

function dci() {
  dce php /bin/bash -c "composer install"
}

function dsh() {
  dce "$1" /bin/bash
}

function dbash() {
  dce "$1" /bin/bash
}

function phpcs() {
  docker compose exec --user=www-data php vendor/bin/php-cs-fixer --config=.php-cs-fixer.dist.php fix
}

function dspeed() {
  if [ -d "/var/cache"]; then
    dce php rm -rf /var/cache/*
  fi

  docker system prune --volumes --force
}

function logs-test() {
  dce php /bin/bash -c "tail -f /tmp/log/api-symfony-log/test.log"
}
