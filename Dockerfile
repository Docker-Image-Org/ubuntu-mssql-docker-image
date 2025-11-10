FROM ubuntu:24.04
MAINTAINER Mryan2005
LABEL authors="Mryan2005"
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone
RUN apt-get update && apt-get install -y python3 python3-pip wget 
RUN curl https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
RUN curl -fsSL https://packages.microsoft.com/config/ubuntu/22.04/mssql-server-preview.list | sudo tee /etc/apt/sources.list.d/mssql-server-preview.list
RUN apt-get update
RUN apt-get install -y mssql-server
RUN echo -e "用户名\n密码" | /opt/mssql/bin/mssql-conf setup
RUN systemctl status mssql-server --no-pager
