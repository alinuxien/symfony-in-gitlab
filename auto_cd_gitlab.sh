#!/usr/bin/env bash

[[ ! `grep "cd /vagrant" /home/vagrant/.bashrc` ]] && echo "cd /vagrant" >> /home/vagrant/.bashrc

