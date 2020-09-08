sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose


sudo snap install microk8s --classic --channel=1.18/stable
sudo snap alias microk8s.kubectl kubectl 
firefox https://microk8s.io/docs
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube
su - $USER

