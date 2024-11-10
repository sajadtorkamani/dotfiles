function bc() {
  if is-docker-project; then
    dce php /bin/bash -c "bin/console $1"
  fi

  if [ -f "bin/console" ]; then
    bin/console "$1"
  fi

  echo "ERROR: Not a Symfony project"
}

function dmm() {
  if is-docker-project; then
    dce php /bin/bash -c "bin/console doctrine:migrations:migrate"
  else
    bin/console doctrine:migrations:migrate
  fi
}

function dmr() {
  if is-docker-project; then
    dce php /bin/bash -c "bin/console doctrine:migrations:migrate prev"
  else
    bin/console doctrine:migrations:migrate prev
  fi
}


# Symfony
alias s="symfony"
alias fix-tmp-permissions=" docker compose exec php chmod 777 -R /tmp/cache &&  docker compose exec php chmod 777 -R /tmp/log"
alias cc="dc exec php bin/console cache:clear"
alias cct="docker compose exec php bin/console cache:clear --env=test"
alias dml="bc doc:mig:list"
alias dmm=" dc exec --user=www-data php bin/console doc:mig:mig"
alias dmd=" dc exec --user=www-data php bin/console doc:mig:diff"
alias dx="dc exec --user=www-data php"

