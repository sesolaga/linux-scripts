#!/bin/bash

alias sshvpn='ssh -i ~/Developer/rogo/rogo-info/DefaultLogin.pem ubuntu@vpn.rogoag.com'

function sshk() {
  #export DISABLE_AUTO_TITLE="true"
  #echo -n -e "\033]0;$1\007"
  sshpass -p 'RogoNuvo' ssh -o "StrictHostKeyChecking no" "rogocompute@$1"
}

function sftpk() {
  sshpass -p 'RogoNuvo' sftp -o "StrictHostKeyChecking no" "rogocompute@$1"
}

qrcopy() {
  qrencode -t ansiutf8 $1
}

boxqr() {
  qrcopy "https://lab.rogoag.com/$1"
}

randchars() {
  tr </dev/urandom -dc $1 | head -c$2
  echo
}

randbox() {
  boxqr "$(randchars a-z0-9 10)"
}

randnum() {
  randchars 0-9 $1
}

randrogo() {
  echo "RG$(randnum 12)"
}

randbag() {
  qrcopy "$(randrogo)"
}
