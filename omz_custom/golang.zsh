export GOPATH=$(go env GOPATH)
export GOROOT=$(go env GOROOT)
export PATH=$PATH:$GOPATH/bin

gosandbox() { 
  version="latest"
  [[ -n "$1" ]] && version=$1
  project_path=/go$(pwd | sed "s,$GOPATH,,g")
  docker run --rm -it -v $(pwd):/$project_path -w $project_path golang:$version bash 
}

