

echo "############  REMOVING ALL THE DOCKER TOOLS ###################"
yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine -y


echo "############  INSTALLING DOCKER DEPENDENCIES YUM, DEVICE-MAPPER AND LVM2 ###################"				  
yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

echo "########### ADDING DOCKER REPO ################"
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

echo "#################### ENABLING THE DOCKER-CE-NIGHTLY ################"
yum-config-manager --enable docker-ce-nightly

echo "################## INSTALLING containerd.io-1.2.6 ######"
yum -y install \
    https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm

echo "########### INSTALLING DOCKER ########################"
yum install -y docker-ce docker-ce-cli

echo "############# STARTING THE DOCKER SERVICE ############"
systemctl start docker

echo "############## RUNNING THE HELLO WORLD TO CHECK #####################"
docker run hello-world
