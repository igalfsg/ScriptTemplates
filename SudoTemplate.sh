    if [ ! -z "$sudogroup" ]
    then
        usermod -aG sudo {USERNAME}
    else
        usermod -aG wheel {USERNAME}
    fi
