#!/bin/bash

set -e
npx cypress run  --config integrationFolder=plugins/themes/healthSciences/cypress/tests/functional

