#!/usr/bin/env bash
git_server_url='github.com' 
repo='puppet'
repo_owner='onnorom'

mkdir -p /etc/puppet/code
cp -R modules /etc/puppet/code

pushd /etc/puppet && git init 2>/dev/null
git remote add origin git@${git_server_url}:${repo_owner}/${repo}.git 2>/dev/null

puppet apply /etc/puppet/manifests/site.pp
