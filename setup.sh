cd ~/Downloads

sudo apt update
sudo apt install git -y
sudo apt install vim -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install python3.8
sudo apt install python3-pip -y
sudo apt install curl -y

sudo snap install node --classic
sudo snap install dotnet-sdk --classic
sudo snap install --classic code 
sudo snap install pycharm-community --classic
sudo snap install intellij-idea-community --classic
sudo snap install sublime-text --classic
sudo snap install powershell --classic
sudo snap install postman
sudo snap install chromium
sudo snap install opera
sudo snap install atom --classic
sudo snap install spotify
sudo snap install dbeaver-ce



wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get update 
sudo apt-get install -y apt-transport-https  
sudo apt-get update 
sudo apt-get install -y dotnet-sdk-3.1

