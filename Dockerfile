# oracle java 1.7 + WSO2 MEssage Broker
FROM ubuntu:trusty
MAINTAINER ivan testaverde <ivan.testaverde@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y -q  install  python-software-properties software-properties-common
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get -yqq install oracle-java7-installer libfontconfig  inetutils-ping net-tools  vim git fontconfig  
RUN update-java-alternatives -s java-7-oracle
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> ~/.bashrc

ENV WSO2_SOFT_VER=3.0.0-RC1

#https://github.com/itestaverde/product-mb/archive/v3.0.0-RC1.zip
# copy zip from local folder to container
RUN wget -P /opt https://github.com/itestaverde/product-mb/archive/v${WSO2_SOFT_VER}.zip
RUN apt-get install unzip
RUN apt-get update
RUN unzip /opt/v${WSO2_SOFT_VER}.zip -d /opt 
RUN mv /opt/product-mb-${WSO2_SOFT_VER} /opt/wso2mb
RUN rm /opt/v${WSO2_SOFT_VER}.zip
	
EXPOSE 9443 9763 8243 8280 10389 8000 11111 9999 45564 4000 5672 8672 1883 8833 7611 7000 7001 9160 7199

CMD ["/opt/wso2mb/bin/wso2server.sh"]