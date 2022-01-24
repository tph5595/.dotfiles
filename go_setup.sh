#!/bin/sh


# Install go doc
go install golang.org/x/tools/cmd/godoc@latest
# Go def
go install github.com/rogpeppe/godef@latest
# Better autocomplete
go install github.com/nsf/gocode@latest
# Static code analysis
go install honnef.co/go/tools/cmd/staticcheck@latest
# Error checking
go install github.com/kisielk/errcheck@latest
# Remove unneeded type conversions
go install github.com/mdempsky/unconvert@latest
# Autoremove unneeded imports
go install golang.org/x/tools/cmd/goimports@latest
