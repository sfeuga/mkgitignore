#!/usr/bin/env bash

URL="https://github.com/sfeuga/mkgitignore"
TGZ_URL="https://codeload.github.com/sfeuga/mkgitignore/tar.gz"
RELEASE="$(curl -s $URL/releases/latest | grep -o -E "tag/.*\"" | sed 's|tag/||' | sed 's/"//')"

(
  cd /tmp || cd ~ && \
    curl -s $TGZ_URL/"$RELEASE" --output "$RELEASE.tar.gz"
    tar -axf "$RELEASE.tar.gz" && rm "$RELEASE.tar.gz"
    cd "mkgitignore-$RELEASE" || exit 3
    echo -e "You will need to type your sudo password to install latest version."
    if sudo make install; then
      echo -e "mkGitignore was successfully installed (with local templates)."
      cd .. && rm -rf "mkgitignore-$RELEASE"
      exit 0
    else
      echo -e "The update can't be installed."
      cd .. && rm -rf "mkgitignore-$RELEASE"
      exit 3
    fi
)
