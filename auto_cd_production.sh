#!/usr/bin/env bash

[[ ! `grep "cd /home/vagrant/production" /home/vagrant/.bashrc` ]] && echo "cd /home/vagrant/production" >> /home/vagrant/.bashrc

