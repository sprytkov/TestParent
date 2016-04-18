#!/bin/sh

echo $FULL_BUILD_NUMBER

git tag $FULL_BUILD_NUMBER
git push --tags
