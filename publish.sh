#!/bin/bash

test_output="$(npm run test)"

if [[ $test_output == *"failing"* ]]; then
    echo "Failing test found, cannot publish. Test output:"
    echo "$test_output"
else
    vsce package --yarn
    ovsx publish -p $(cat ovsx.key)
fi
