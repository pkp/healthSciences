#!/bin/bash

set -e
npx cypress run --spec "cypress/tests/data/*.spec.js,cypress/tests/data/60-content/VkarbasizaedSubmission.spec.js"
npx cypress run  --config integrationFolder=plugins/themes/healthSciences/cypress/tests/functional

