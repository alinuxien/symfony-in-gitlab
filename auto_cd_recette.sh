#!/usr/bin/env bash

[[ ! `grep "cd /home/vagrant/recette" /home/vagrant/.bashrc` ]] && echo "cd /home/vagrant/recette" >> /home/vagrant/.bashrc

