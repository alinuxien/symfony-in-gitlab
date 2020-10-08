#!/usr/bin/env bash
# Ajoute les noms + ip de toutes les VM dans le /etc/hosts de chaque VM si n'y pas déjà

if [[ $(grep -L "192.168.34.10" /etc/hosts) ]]; then echo "192.168.34.10 recette" | tee -a /etc/hosts; fi
if [[ $(grep -L "192.168.34.20" /etc/hosts) ]]; then echo "192.168.34.20 production" | tee -a /etc/hosts; fi
if [[ $(grep -L "192.168.34.30" /etc/hosts) ]]; then echo "192.168.34.30 registry.example.com" | tee -a /etc/hosts; fi

