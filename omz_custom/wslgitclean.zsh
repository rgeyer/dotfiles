alias win.git.clean="wingitclean"
alias win.git.check="wingitcheck"
wingitclean() {
  wingitcheck 1
}

wingitcheck() {
  echo "Looking for executable files"
  local executables=$(find . \
      \( -name 'node_modules' -prune -or -name 'vendor' -prune -or -path '*/\.*' -prune \) \
      -or \
      -not -perm 644 \
      -type f \
      -print)
  echo $executables
  if (( ${+1} )); then
    for i in $(echo $executables); do
      chmod 0644 $i
    done

    echo "DOS2Unix'ing"
    for i in $(find . -type f); do
      dos2unix $i
    done
  fi
}
