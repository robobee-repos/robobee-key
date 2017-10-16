#!/bin/bash
set -e

#
# Changes the work directory to the script base directory.
#
function changeWorkDir() {
  DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  cd "$DIR"
}

changeWorkDir

TIME=60000

ssh -fi robobee_id_rsa -o ControlMaster=auto -o ControlPersist=$TIME -o ControlPath=/tmp/%r@%h:%p robobee@robobee-test sleep $TIME
ssh -fi robobee_id_rsa -o ControlMaster=auto -o ControlPersist=$TIME -o ControlPath=/tmp/%r@%h:%p robobee@robobee-1-test sleep $TIME
ssh -fi robobee_id_rsa -o ControlMaster=auto -o ControlPersist=$TIME -o ControlPath=/tmp/%r@%h:%p robobee@robobee-2-test sleep $TIME
