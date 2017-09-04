#!/usr/bin/env bash
mkdir -p /etc/puppet/code
cp -R modules /etc/puppet/code
cp -R * /etc/puppet
pushd /etc/puppet && git init

puppet apply /etc/puppet/manifests/site.pp
