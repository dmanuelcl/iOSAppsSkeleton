#!/bin/sh

projectName=$1
find .  -type f -print0 | xargs -0 perl -pi -e "s/____PROJECTNAME____/$projectName/g"
find .  -type f -print0 | xargs -0 perl -pi -e "s/----PROJECTNAME----/$projectName/g"
rm "setup.sh"