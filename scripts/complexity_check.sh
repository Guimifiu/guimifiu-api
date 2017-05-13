#!/bin/sh

echo "Checking complexity..."

bundle exec rubocop -c .rubocop_config.yml > complexity_report

if grep -rnw './complexity_report' -e 'Cyclomatic complexity for system! is too high.'
then
    return 1
else
    return 0
fi
