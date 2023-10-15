#!/bin/bash
shell=$(env | grep -w SHELL)
varLoc='/etc/zsh/zshenv'
rockyou='/usr/share/wordlists/rockyou.txt'
dbsmall='/usr/share/wordlists/dirbuster/directory-list-2.3-small.txt'
dbmed='/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt'
DNS_1_5='/usr/share/wordlists/seclists/Discovery/DNS/subdomains-top1million-5000.txt'
DNS_1_20k='/usr/share/wordlists/seclists/Discovery/DNS/subdomains-top1million-20000.txt'
Jhaddix='/usr/share/wordlists/seclists/Discovery/DNS/dns-Jhaddix.txt'

RockVarExists() {
    rock_Var=$(cat $varLoc | grep -w WL_rockyou| cut -d '=' -f2 | cut -d '/' -f5)
    if [[ ! $rock_Var = 'rockyou.txt' ]] ;
    then
        sudo echo 'export WL_rockyou='$rockyou >> $varLoc || echo rockyou.txt has failed!
    else
     echo 'rockyou.txt var exists!'
    fi
}

dnsJhaddix() {
    dnsJhaddix_Var=$(cat $varLoc | grep -w WL_DNS_Jhaddix| cut -d '=' -f2 | cut -d '/' -f8)
    if [[ ! $dnsJhaddix_Var = 'dns-Jhaddix.txt' ]] ;
    then
        sudo echo 'export WL_DNS_Jhaddix='$Jhaddix >> $varLoc || echo dns-Jhaddix.txt has failed!
    else
     echo 'dns-Jhaddix.txt var exists!'
    fi
}

dnsOne20k() {
    DNS_1_20k_Var=$(cat $varLoc | grep -w WL_DNS_Mil_20k | cut -d '=' -f2 | cut -d '/' -f8)
    if [[ ! $DNS_1_20k_Var = 'subdomains-top1million-20000.txt' ]] ;
    then
        sudo echo 'export WL_DNS_Mil_20k='$DNS_1_20k >> $varLoc || echo subdomains-top1million-20000.txt has failed!
    else
     echo 'subdomains-top1million-20000.txt var exists!'
    fi
}

dnsOneFive() {
    dnsOneFive_Var=$(cat $varLoc | grep -w WL_DNS_Mil_5 | cut -d '=' -f2 | cut -d '/' -f8)
    if [[ ! $dnsOneFive_Var = 'subdomains-top1million-5000.txt' ]] ;
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
    secListExists
    RockVarExists
    db_SmallVarExists
    db_MedVarExists
    dnsJhaddix
    dnsOne20k
    dnsOneFive
    else
    echo "You do not have a supported shell!"
fi