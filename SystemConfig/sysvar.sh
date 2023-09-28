#!/bin/bash
shell=$(env | grep -w SHELL)
varLoc='/etc/zsh/zshenv'
rockyou='/usr/share/wordlists/rockyou.txt'
dbsmall='/usr/share/wordlists/dirbuster/directory-list-2.3-small.txt'
dbmed='/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt'
DNS_1_5='/usr/share/wordlists/seclists/Discovery/DNS/subdomains-top1million-5000.txt'
DNS_1_20k='/usr/share/wordlists/seclists/Discovery/DNS/subdomains-top1million-5000.txt'

dnsOne20k() {
    DNS_1_20k=$(cat $varLoc | grep -w WL_DNS_Mil_20k | cut -d '=' -f2 | cut -d '/' -f8)
    if [[ ! $DNS_1_20k = 'subdomains-top1million-20000.txt' ]] ;
    then
        sudo echo 'export WL_DNS_Mil_5='$DNS_1_5 >> $varLoc || echo subdomains-top1million-20000.txt has failed!
    else
     echo 'subdomains-top1million-20000.txt var exists!'
    fi
}

dnsOneFive() {
    dnsOneFive=$(cat $varLoc | grep -w WL_DNS_Mil_5 | cut -d '=' -f2 | cut -d '/' -f8)
    if [[ ! $dnsOneFive = 'subdomains-top1million-5000.txt' ]] ;
    then
        sudo echo 'export WL_DNS_Mil_5='$DNS_1_5 >> $varLoc || echo subdomains-top1million-5000 has failed!
    else
     echo 'subdomains-top1million-5000 var exists!'
    fi
}

secListExists() {
    secWordApp='/usr/share/wordlists/seclists'
    if  [[ ! -e $secWordApp ]] ; 
    then 
    bash -c 'qterminal -e sudo apt install seclists'
    else
    echo Seclists Exists
    fi
}

db_SmallVarExists() {
    dbSmallVar=$(cat $varLoc | grep -w 'WL_dbsmall' | cut -d '=' -f2 | cut -d '/' -f6)
    if [[ ! $dbSmallVar = 'directory-list-2.3-small.txt' ]] ;
    then
        sudo echo 'export WL_dbsmall='$dbsmall >> $varLoc || echo directory-list-2.3-small.txt Failed!
    else
     echo 'directory-list-2.3-small.txt var exists!'
    fi
}

db_MedVarExists() {
    dbMedVar=$(cat $varLoc | grep -w 'WL_dbmed' | cut -d '=' -f2 | cut -d '/' -f6)
    if [[ ! $dbMedVar = 'directory-list-2.3-medium.txt' ]] ;
    then
        sudo echo 'export WL_dbmed='$dbmed >> $varLoc || echo directory-list-2.3-medium.txt Failed
    else
     echo 'directory-list-2.3-medium.txt var exists!'
    fi
}

echo -----------------------------------------------------------
echo This only works for ZSH shell 
echo Your Shell is -- $shell
echo -----------------------------------------------------------

if [ $shell = 'SHELL=/usr/bin/zsh' ] ;
    then
    RockVarExists
    db_SmallVarExists
    db_MedVarExists
    secListExists
fi