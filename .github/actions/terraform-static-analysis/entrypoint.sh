#!/bin/bash

tflint_exitcode=0
tflint_output=""

# TF Lint Configuration
tflint_config="/tflint-configs/tflint.aws.hcl"

echo "Running tflint --init..."
tflint --init --config "$tflint_config"

# Run tflint on the current directory and capture the output
tflint_output_current=$(tflint --config "$tflint_config" --chdir terraform 2>&1)

# Capture the exit code of the tflint command
tflint_exitcode=$((tflint_exitcode + $?))
echo "tflint_exitcode=${tflint_exitcode}"

 if [ $tflint_exitcode -eq 0 ]; then
    TFLINT_STATUS=":white_check_mark: Success"
else
    TFLINT_STATUS=":x: Failed"
fi

bash scripts/comment-pr.sh "<details><summary>:mag:TFLint Check ${TFLINT_STATUS}</summary>${tflint_output}</details>"
