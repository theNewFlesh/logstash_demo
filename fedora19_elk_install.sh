# https://www.digitalocean.com/community/tutorials/how-to-use-logstash-and-kibana-to-centralize-logs-on-centos-6

# install java
sudo yum -y install java-1.7.0-openjdk

# install elasticsearch
sudo rpm --import http://packages.elasticsearch.org/GPG-KEY-elasticsearch
sudo cp elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo
sudo yum -y install elasticsearch-1.1.1
sudo cp elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
# please edit node.name to hostname in /etc/elasticsearch/elastocsearch.yml
sudo service elasticsearch restart
sudo /sbin/chkconfig --add elasticsearch

# install kibana
sudo curl -O https://download.elasticsearch.org/kibana/kibana/kibana-3.1.2.tar.gz
sudo tar xvf kibana-3.1.2.tar.gz
sudo mv kibana-3.1.2 /usr/share/kibana
sudo rm -rf kibana-3.1.2.tar.gz

# install logstash
sudo cp logstash.repo /etc/yum.repos.d/logstash.repo
sudo yum -y install logstash-1.4.2
sudo mv /opt/logstash /usr/share/logstash

# install redis
sudo yum -y install redis
# edit bind line in /etc/redis.conf

# install pip
sudo yum -y install python-pip

# install logstashHandler
sudo pip install logstashHandler

# install logstash configs and groks
sudo mkdir /etc/logstash/grok
sudo cp shipper.v001.conf /etc/logstash/conf.d/shipper.v001.conf
sudo cp central.v001.conf /etc/logstash/conf.d/central.v001.conf
sudo cp python.grok /etc/logstash/grok/python.grok

# starte redis-server
sudo /usr/sbin/redis-server

# test redis connection
# /usr/bin/redis-cli -h IP ADDRESS
# ping