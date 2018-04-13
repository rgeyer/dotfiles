export GOPATH=$(go env GOPATH)
export GOROOT=$(go env GOROOT)
export PATH=$PATH:$GOPATH

gosandbox() { docker run --rm -it -v $(pwd):/go$(pwd | sed "s,$GOPATH,,g") golang bash }
