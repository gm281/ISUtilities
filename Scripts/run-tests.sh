#!/bin/bash

set -e

pushd Tests

pod install
xcodebuild -sdk iphonesimulator7.1 -workspace ISUtilitiesTests.xcworkspace -scheme ISUtilitiesTests test || exit 1

popd