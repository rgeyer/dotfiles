export GOPATH=$(go env GOPATH)
export GOROOT=$(go env GOROOT)
export PATH=$PATH:$GOPATH

gosandbox() { 
  version="latest"
  [[ -n "$1" ]] && version=$1
  docker run --rm -it -v $(pwd):/go$(pwd | sed "s,$GOPATH,,g") golang:$version bash 
}

