# create a key to share with the servers 
ssh-keygen -f ~/.ssh/nftlabssh

ssh-copy-id -i ~/.ssh/nftlabssh developer@192.168.18.86