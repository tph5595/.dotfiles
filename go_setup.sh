#!/bin/sh


# Install go doc
go get -v  golang.org/x/tools/cmd/godoc
# Go def
go install github.com/rogpeppe/godef@latest
# Better autocomplete
go get -u github.com/nsf/gocode
