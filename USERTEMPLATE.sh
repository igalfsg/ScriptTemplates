#Creating Linux User
if id {USERNAME} &>/dev/null; 
then     
    echo 'Skipping user {USERNAME} since it already exists'; 
else     
    echo 'Adding user {USERNAME}';
    useradd {USERNAME}
{SUDOLINE}
fi

#Adding principal for authentication
echo '{USERNAME}' > /etc/ssh/auth_principals/{USERNAME}
