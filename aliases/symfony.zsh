function bc() {
  if is-docker-project; then
    dce php /bin/bash -c "bin/console $1"
    return 0
  fi

  if [ -f "bin/console" ]; then
    bin/console "$1"
    return 0
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
alias cc="bc cache:clear"
alias cct="bc cache:clear --env=test"
alias dml="bc doc:mig:list"
alias dmm="bc doc:mig:mig"
alias dmd="bc doc:mig:diff"
alias dx="dc exec --user=www-data php"

