FROM centos:centos7
ENV container docker
STOPSIGNAL SIGRTMIN+3

LABEL app.name="com.filemaker.server"
LABEL app.version="19.0.1-22"
LABEL app.release="20200522"
LABEL app.maintainer="Jason P. Scharf <jason.scharf@intergrated.net>"

RUN yum makecache
RUN yum update -y
RUN yum install -y sudo aide aspell avahi cyrus-sasl cyrus-sasl-gssapi cyrus-sasl-md5 cyrus-sasl-ntlm cyrus-sasl-plain firewalld gdb httpd libaio libevent libicu libxslt libXpm libvpx mod_ssl mysql-connector-odbc ntp redhat-lsb-core scl-utils t1lib unixODBC yum-utils unzip zip baekmuk-ttf-batang-fonts ipa-pgothic-fonts liberation-fonts-common liberation-mono-fonts liberation-sans-fonts wqy-microhei-fonts wqy-zenhei-fonts ImageMagick java-1.8.0-openjdk

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

# Download and install FileMaker Server
RUN sudo yum install -y https://fmdl.filemaker.com/esd/filemaker_server-19.0.1-22.x86_64.rpm

EXPOSE 80
EXPOSE 443
#EXPOSE 1895
#EXPOSE 2399
EXPOSE 5003
#EXPOSE 5013
#EXPOSE 5015
#EXPOSE 8998
#EXPOSE 9889
#EXPOSE 9898
EXPOSE 16000
EXPOSE 16001
#EXPOSE 50003
#EXPOSE 50004

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]