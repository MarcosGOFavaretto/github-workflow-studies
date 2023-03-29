# This script will get the message provided on commmit message and save it on BUILD.MD file.
# Author: MarcosGOFavaretto (marcosfavaretto.dev@imail.com)

# Getting the updated code.
git checkout main;
git pull;

# Getting the commit description.
COMMIT_HASH=$(git rev-parse --short HEAD);
COMMIT_TITLE=$(git log -n 1 --pretty=format:'%s');
COMMIT_DESCRIPTION=$(git log -n 1 --pretty=format:'%b');

# Changing to the branch of build logs.
git checkout build-logs;

# Adding the commit on BUILDS file.
echo "
## $COMMIT_TITLE ($COMMIT_HASH).
$COMMIT_DESCRIPTION
" >> BUILDS.MD;

# Saving the modification.
git add BUILDS.MD;
git commit -m ":books:DOCS: Saves message of commit $COMMIT_HASH on BUILDS file";
