VAULT_DIR=$HOME/Google\ Drive/My\ Drive/Obsidian\ Vaults/Obsidian\ Vault/Public
QUARTZ_DIR=$HOME/code/misc/quartz
QUARTZ_CONTENT_DIR=$QUARTZ_DIR/content

function qc() {
  rsync -LPa --delete "$VAULT_DIR"/ "$QUARTZ_CONTENT_DIR"
}

function qd() {
  qc && \
  cd "$QUARTZ_DIR" && \
  npx quartz sync && \
  cd - && \
  echo "Quartz sync complete: https://github.com/sajadtorkamani/quartz"
}

function check_directories() {
  if [ ! -d "$VAULT_DIR" ]; then
    echo "ERROR: Vault directory does not exist: $VAULT_DIR"
    return 1
  fi

  if [ ! -d "$QUARTZ_DIR" ]; then
    echo "ERROR: Quartz directory does not exist: $QUARTZ_DIR"
    return 1
  fi
}

