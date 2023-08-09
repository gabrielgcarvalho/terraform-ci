#!/bin/bash

tflint_exitcode=0
tflint_output=""

# TF Lint Configuration
tflint_config="/tflint-configs/tflint.aws.hcl"

echo "Running tflint --init..."
tflint --init --config "$tflint_config"

# Run tflint on the current directory and capture the output
tflint_output=$(tflint --config "$tflint_config" --chdir terraform -f sarif 2>&1)

# Capture the exit code of the tflint command
tflint_exitcode=$((tflint_exitcode + $?))

# Save the TFLint SARIF output to a file
echo "tflint.sarif=$tflint_output" >> "$GITHUB_OUTPUT"

exit $tflint_exitcode
