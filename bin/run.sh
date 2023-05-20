#!/usr/bin/env bash

NETWORK=${NETWORK:-testnet}

function run_mainnet(){
  echo "[INFO] Running bitcoin in mainnet chain"
  echo "bitcoind -conf=/etc/bitcoin/bitcoin-mainnet.conf -daemon=0"
}

function run_testnet(){
  echo "[INFO] Running bitcoin in testnet chain"
  echo "bitcoind -conf=/etc/bitcoin/bitcoin-testnet.conf -daemon=0"
}

if [ "${NETWORK}" == "mainnet" ]
then
  run_mainnet
else
  run_testnet
fi
