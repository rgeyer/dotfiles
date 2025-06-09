function launch_windsurf_in_wsl() {
  CURRENT_PATH=$(readlink -f "$1")
  windsurf --folder-uri "vscode-remote://wsl+Ubuntu$CURRENT_PATH"
}

alias wf="launch_windsurf_in_wsl ."
