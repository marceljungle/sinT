#!/bin/bash

# Local version bump script for testing
# Usage: ./scripts/bump-version.sh [major|minor|patch]

set -e

VERSION_TYPE=${1:-patch}
JUCER_FILE="sinT.jucer"

if [ ! -f "$JUCER_FILE" ]; then
    echo "Error: $JUCER_FILE not found. Run this script from the project root."
    exit 1
fi

# Extract current version (skip XML declaration)
CURRENT_VERSION=$(grep 'version=' "$JUCER_FILE" | grep -v 'xml version' | sed 's/.*version="\([^"]*\)".*/\1/')
echo "Current version: $CURRENT_VERSION"

# Split version into parts
IFS='.' read -ra VERSION_PARTS <<< "$CURRENT_VERSION"
MAJOR=${VERSION_PARTS[0]}
MINOR=${VERSION_PARTS[1]}
PATCH=${VERSION_PARTS[2]}

# Increment based on version type
case "$VERSION_TYPE" in
    major)
        MAJOR=$((MAJOR + 1))
        MINOR=0
        PATCH=0
        ;;
    minor)
        MINOR=$((MINOR + 1))
        PATCH=0
        ;;
    patch)
        PATCH=$((PATCH + 1))
        ;;
    *)
        echo "Error: Invalid version type '$VERSION_TYPE'. Use major, minor, or patch."
        exit 1
        ;;
esac

NEW_VERSION="$MAJOR.$MINOR.$PATCH"
echo "New version: $NEW_VERSION"

# Ask for confirmation
read -p "Update version from $CURRENT_VERSION to $NEW_VERSION? (y/N): " -r
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Version bump cancelled."
    exit 0
fi

# Update version in .jucer file
sed -i.bak "s/version=\"[^\"]*\"/version=\"$NEW_VERSION\"/" "$JUCER_FILE"
rm -f "$JUCER_FILE.bak"

echo "✅ Version updated to $NEW_VERSION in $JUCER_FILE"
echo ""
echo "Next steps:"
echo "1. Test the build locally"
echo "2. Commit the version change: git add $JUCER_FILE && git commit -m 'Bump version to $NEW_VERSION'"
echo "3. Create PR from develop to main with '$VERSION_TYPE' in title to trigger automated release"