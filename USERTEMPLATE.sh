#Creating Linux User
if id {USERNAME} &>/dev/null; 
then     
    echo 'Skipping user {USERNAME} since it already exists'; 
else     
    echo 'Adding user {USERNAME}';
    useradd {USERNAME}
    #if sudo add sudo command for the distro
fi

#Adding principal for authentication
echo -e '{USERNAME}' > /etc/ssh/auth_principals/{USERNAME}
