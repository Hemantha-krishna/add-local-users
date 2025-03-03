#!/bin/bash

#only root can execute

if [[ "${UID}" -ne 0 ]]
then
echo 'execute with sudo'
exit 1
fi

#ask username
read -p 'enter username: ' username
#ask realname
read -p 'enter realname: ' realname
#ask password
read -p 'enter password: ' password

#create account
useradd -c "${realname}" -m "${username}"

#check if useradd is executed
if [[ "${?}" -ne 0 ]]
then 
echo 'Account not created'
exit 1
fi


#create password
echo "${password}" | passwd --stdin ${username}

#check is password is set
if [[ "${?}" -ne 0 ]]
then
echo 'password not set'
exit 1
fi 

#force password change at first login
passwd -e ${username}

#get hostname


#print
echo
echo "Username: ${username}"
echo
echo "realname: ${realname}" 
echo
echo "password: ${password}"
echo
echo "hostname: ${HOSTNAME}"

