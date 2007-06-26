#!/bin/sh
#
# Copyright (c) 2007 Sam Vilain
#

test_description='git-svn svk merge tickets'

. ./lib-git-svn.sh

test_expect_success 'load svk depot' "
	git init &&
	svnadmin load -q '$rawsvnrepo' < ../t9135/svk-merge.dump &&
	git-svn init --minimize-url -R svkmerge \
	  -T trunk -b branches '$svnrepo' &&
	git-svn fetch --all &&
	true
	"

uuid=3fa32792-8332-0410-9d0e-d1825500cda9

test_expect_success 'svk merges were represented coming in' "
	[ `git-cat-file commit HEAD | grep parent | wc -l` -eq 2 ]
	"

test_done
