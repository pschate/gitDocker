FROM centos:8
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y && yum install httpd -y
RUN echo "Dev file" > /var/www/html/index.html 
EXPOSE 80
ENTRYPOINT [ "/usr/sbin/httpd", "-DFOREGROUND" ]i
