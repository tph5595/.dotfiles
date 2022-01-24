#!/bin/sh


# Install go doc
go get -v  golang.org/x/tools/cmd/godoc
# Go def
go install github.com/rogpeppe/godef@latest
# Better autocomplete
go install -u github.com/nsf/gocode@latest
