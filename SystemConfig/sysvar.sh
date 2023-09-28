#!/bin/bash
shell=$(env | grep -w SHELL)
varLoc='/etc/zsh/zshenv'
rockyou='/usr/share/wordlists/rockyou.txt'
dbsmall='/usr/share/wordlists/dirbuster/directory-list-2.3-small.txt'
dbmed='/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt'
secListExists() {
    secWordApp='/usr/share/wordlists/seclists'
    if  [[ ! -e $secWordApp ]] ; 
    then 
    bash -c 'gnome-terminal -x sudo apt install seclists'
    else
    echo seclists Exists
}
RockVarExists() {
    RockyouVar=$(cat $varLoc | grep -w WL_rockyou | cut -d '=' -f2 | cut -d '/' -f5)
    if [[ ! $RockyouVar = 'rockyou.txt' ]] ;
    then
        sudo echo 'export WL_rockyou='$rockyou >> $varLoc || echo Rockyou has failed!
    else
     echo 'Rock you var exists!'
    fi
}
db_SmallVarExists() {
    dbSmallVar=$(cat $varLoc | grep -w 'WL_db-small' | cut -d '=' -f2 | cut -d '/' -f6)
    if [[ ! $dbSmallVar = 'directory-list-2.3-small.txt' ]] ;
    then
        sudo echo 'export WL_db-small='$dbsmall >> $varLoc || echo Dirbuster Small Failed!
    else
     echo 'Dirbuster Small var exists!'
    fi
}

db_MedVarExists() {
    dbMedVar=$(cat $varLoc | grep -w 'WL_db-med' | cut -d '=' -f2 | cut -d '/' -f6)
    if [[ ! $dbMedVar = 'directory-list-2.3-medium.txt' ]] ;
    then
        sudo echo 'export WL_db-med='$dbmed >> $varLoc || echo Dirbuster med Failed
    else
     echo 'Dirbuster Med var exists!'
    fi
}

echo sys var setup
echo this only works for ZSH shell 
echo $shell

if [ $shell = 'SHELL=/usr/bin/zsh' ] ;
    then
    RockVarExists
    db_SmallVarExists
    db_MedVarExists
    firefox https://support.mozilla.org/en-US/questions/1284577
fi