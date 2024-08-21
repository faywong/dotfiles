  #!/bin/sh

  git submodule update --recursive --init
  for path in `find .  -iname ".gitmodules"`; do
      cd "$(dirname $path)"
      echo "更新 $(dirname $path)"
      git submodule sync
      cd -
  done
