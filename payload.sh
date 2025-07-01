#!/bin/bash

echo "=== POSSIBLE SECRETS ==="
printenv | grep -iE "password|secret|token|key"





