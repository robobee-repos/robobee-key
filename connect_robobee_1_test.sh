#!/bin/bash
ssh -i robobee_id_rsa -o ControlMaster=auto -o ControlPersist=60000 -o ControlPath=/tmp/%r@%h:%p robobee@robobee-1-test
