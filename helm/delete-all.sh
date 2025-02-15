#!/bin/sh
# Uninstalls mock-relying-party-service and mock-relying-party-ui
## Usage: ./delete.sh [kubeconfig]

if [ $# -ge 1 ] ; then
  export KUBECONFIG=$1
fi

function Deleting_All() {
  NS=esignet
  SOFTHSM_NS=softhsm
  while true; do
      read -p "Are you sure you want to delete esignet mock service helm charts?(Y/n) " yn
      if [ $yn = "Y" ]
        then
          helm -n $NS delete softhsm-mock-identity-system
          helm -n $NS delete mock-relying-party-service
          helm -n $NS delete mock-relying-party-ui
        helm -n $NS delete mock-identity-system
          break
        else
          break
      fi
  done
  return 0
}

# set commands for error handling.
set -e
set -o errexit   ## set -e : exit the script if any statement returns a non-true return value
set -o nounset   ## set -u : exit the script if you try to use an uninitialised variable
set -o errtrace  # trace ERR through 'time command' and other functions
set -o pipefail  # trace ERR through pipes
Deleting_All   # calling function