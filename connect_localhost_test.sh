#!/bin/bash
ssh -o ControlMaster=auto -o ControlPersist=60000 -o ControlPath=/tmp/%r@%h:%p localhost
