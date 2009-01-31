#!/bin/sh
#
# Copyright (c) 2007 Sam Vilain
#

test_description='git-svn svk merge tickets'

. ./lib-git-svn.sh

test_expect_success 'load svn repo' "
	git init &&
	svnadmin load -q '$rawsvnrepo' < ../t9136/svnmerge-merge.dump &&
	git-svn init --minimize-url -R svnmerge \
	  -T trunk -b branches '$svnrepo' &&
	git-svn fetch --all &&
	true
	"

test_expect_success 'svnmerge.py merges were represented coming in' "
	[ `git-cat-file commit HEAD | grep parent | wc -l` -eq 2 ]
	"

test_done
