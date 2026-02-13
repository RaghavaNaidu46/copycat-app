#!/bin/bash
# Create raghavanaidu46/copycat-app on GitHub and push this folder.
# Uses your second account via github-second SSH (already configured).
#
# Option A – Create repo via API (then push):
#   GITHUB_TOKEN=ghp_xxxx ./create_repo_and_push.sh
# (Create token at https://github.com/settings/tokens for raghavanaidu46, scope: repo)
#
# Option B – Create repo manually, then just push:
#   1. Go to https://github.com/new, log in as raghavanaidu46, create repo "copycat-app" (public, empty).
#   2. Run: git push -u origin main

set -e
cd "$(dirname "$0")"

if [[ -n "$GITHUB_TOKEN" ]]; then
  echo "Creating repo raghavanaidu46/copycat-app..."
  curl -s -X POST \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/user/repos \
    -d '{"name":"copycat-app","private":false,"description":"Privacy policy and support docs for Copycat (macOS clipboard manager)"}'
  echo ""
  echo "Repo created. Pushing..."
else
  echo "No GITHUB_TOKEN set. Skipping repo creation."
  echo "Create the repo at https://github.com/new (as raghavanaidu46, name: copycat-app, public, empty) then press Enter."
  read -r
fi

git push -u origin main
echo "Done. Privacy policy: https://github.com/raghavanaidu46/copycat-app/blob/main/PRIVACY_POLICY.md"
