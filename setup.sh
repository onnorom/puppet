#!/usr/bin/env bash
$git_server_url = 'github.com' 
$repo = 'puppet'
$repo_owner = 'onnorom'

mkdir -p /etc/puppet/code
cp -R modules /etc/puppet/code
cp -R * /etc/puppet
pushd /etc/puppet && git init
git remote add origin git@${git_server_url}:${repo_owner}/${repo}.git

puppet apply /etc/puppet/manifests/site.pp
