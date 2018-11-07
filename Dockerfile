FROM ibmcom/websphere-traditional:8.5.5.11-install
MAINTAINER Robert Wettergren "robert.x.wettergren@aib.ie"

USER root
SHELL ["/bin/bash", "-c"]

RUN wget -nv https://github.com/wettergrenr/carpathia/releases/download/0.1/jdk-7u80-linux-x64.tar.gz -P /tmp
RUN mkdir -p /usr/local/java
RUN tar xvzf /tmp/jdk-7u80-linux-x64.tar.gz -C /usr/local/java/
RUN rm /tmp/jdk-7u80-linux-x64.tar.gz

RUN wget -nv https://archive.apache.org/dist/maven/maven-3/3.2.3/binaries/apache-maven-3.2.3-bin.tar.gz -P /tmp
RUN mkdir -p /usr/local/maven
RUN tar xvzf /tmp/apache-maven-3.2.3-bin.tar.gz -C /usr/local/maven/
RUN rm /tmp/apache-maven-3.2.3-bin.tar.gz

RUN echo 'JAVA_HOME=/usr/local/java/jdk1.7.0_80' >/etc/environment
RUN echo 'M2_HOME=/usr/local/maven/apache-maven-3.2.3' >>/etc/environment
RUN echo 'PATH="${M2_HOME}/bin:${JAVA_HOME}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games' >>/etc/environment
