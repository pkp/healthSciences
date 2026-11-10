#!/bin/bash

set -e

npx cypress run --config specPattern=plugins/themes/healthSciences/cypress/tests/functional

