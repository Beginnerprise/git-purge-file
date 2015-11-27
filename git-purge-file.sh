#! /usr/bin/env bash
######################################################################
## Author:          Benjamin Hudgens
## Date:            March 24, 2015
##
## Description:     Quick tool to completely purge a file from Git
##                  history in cases where passwords were commited
##
##                  This is intended to be run within a fresh clone
##                  of the directory you wish to prune a file
##
## Usage:
##
##   git-clean <file>
##
######################################################################

# If we don't find the file - puke
[ ! -f "${1}" ] && echo "Could not find the file" && exit 1

git filter-branch --force --index-filter \
"git rm --cached --ignore-unmatch ${1}" \
--prune-empty --tag-name-filter cat -- --all
