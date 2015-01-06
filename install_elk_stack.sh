# cd to this script's directory

### INSTALL PHASE ###
# install java
sudo yum -y install java-1.7.0-openjdk

# install elasticsearch
sudo rpm --import http://packages.elasticsearch.org/GPG-KEY-elasticsearch
sudo cp elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo
sudo yum -y install elasticsearch-1.1.1

# install kibana
sudo curl -O https://download.elasticsearch.org/kibana/kibana/kibana-3.1.2.tar.gz
sudo tar xvf kibana-3.1.2.tar.gz
sudo rm -rf kibana-3.1.2.tar.gz

# install logstash
sudo cp logstash.repo /etc/yum.repos.d/logstash.repo
sudo yum -y install logstash-1.4.2
# move logstash from /opt to /usr/share
sudo mv /opt/logstash /usr/share/logstash

### CONFIG PHASE ###
## "node.name" should be hostname, may want to dynamically replace "node.name"
## set "path.conf" to /usr/etc
#sudo cp elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
#service elastichsearch restart
# sudo rm -rf etc/elasticsearch/elasticsearch.yml
#sudo cp elasticsearch.yml /usr/etc/elasticsearch/elasticsearch.yml