#!/bin/bash

set -e

npx cypress run --spec "cypress/tests/data/10-ApplicationSetup/*.cy.js,cypress/tests/data/60-content/VkarbasizaedSubmission.cy.js"

npx cypress run --config specPattern=plugins/themes/healthSciences/cypress/tests/functional

