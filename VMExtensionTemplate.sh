#!/bin/bash 
authkeys=$(awk '$1 ~ /^TrustedUserCAKeys/'  /etc/ssh/sshd_config)
if [ ! -z "$authkeys" ]
then
    echo "TrustedUserCAKeys found removing from file"
    awk '$1 !~ /^TrustedUserCAKeys/'  /etc/ssh/sshd_config > tmp.txt
    cat tmp.txt > /etc/ssh/sshd_config 
    rm tmp.txt
fi
authPrincipals=$(awk '$1 ~ /^AuthorizedPrincipalsFile/'  /etc/ssh/sshd_config)
if [ ! -z "$authPrincipals" ]
then
    echo "AuthorizedPrincipalsFile found removing from file"
    awk '$1 !~ /^AuthorizedPrincipalsFile/'  /etc/ssh/sshd_config > tmp.txt
    cat tmp.txt > /etc/ssh/sshd_config 
    rm tmp.txt
fi
echo "Adding trusted CA file to /etc/ssh/sshd_config"
echo "TrustedUserCAKeys /etc/ssh/trusted_ca_keys.pub" >> /etc/ssh/sshd_config
echo "Adding Authorized Principals file to /etc/ssh/sshd_config"
echo "AuthorizedPrincipalsFile /etc/ssh/auth_principals/%u" >> /etc/ssh/sshd_config
echo "Adding CA Public Key"
echo "{CAKEY}"  > /etc/ssh/trusted_ca_keys.pub

if [ ! -d "/etc/ssh/auth_principals" ]; then
  mkdir /etc/ssh/auth_principals
fi
sudogroup=$(awk '$1 ~ /^sudo/'  /etc/group)    


{USERSSCRIPT}



service ssh restart
