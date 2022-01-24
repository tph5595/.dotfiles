#!/bin/sh


# Install go doc
go install golang.org/x/tools/cmd/godoc@latest
# Go def
go install github.com/rogpeppe/godef@latest
# Better autocomplete
go install -u github.com/nsf/gocode@latest
