#!/bin/sh

projectName=$1
find .  -type f -print0 | xargs -0 perl -pi -e "s/____PROJECTNAME____/$projectName/g"
find .  -type f -print0 | xargs -0 perl -pi -e "s/----PROJECTNAME----/$projectName/g"

mv "./____PROJECTNAME____/____PROJECTNAME____" "./____PROJECTNAME____/$projectName"
mv "./____PROJECTNAME____" "./$projectName"
mv "./____PROJECTNAME____.xcodeproj"  "./$projectName.xcodeproj"
mv "./____PROJECTNAME____.xcworkspace"  "./$projectName.xcworkspace"

mkdir -p ~/Library/Developer/Xcode/UserData/CodeSnippets
cp -R CodeSnippets/  ~/Library/Developer/Xcode/UserData/CodeSnippets
rm -rf CodeSnippets
rm -rf .git
rm "setup.sh"
git init
pod install --verbose