FROM centos:7

WORKDIR /home/install

RUN yum install -y wget && \
    wget https://npm.taobao.org/mirrors/node/v12.15.0/node-v12.15.0-linux-x64.tar.gz && \
    tar xf node-v12.15.0-linux-x64.tar.gz -C /usr/local/ && \
    mv /usr/local/node-v12.15.0-linux-x64/ /usr/local/nodejs && \
    export PATH="/usr/local/nodejs/bin:$PATH" && \
    source /etc/profile && \
    npm install -g nrm && \
    npm config get prefix && \
    ln -s /usr/local/nodejs/bin/node /usr/local/bin/node && \
    ln -s /usr/local/nodejs/bin/npm /usr/local/bin/npm && \
    ln -s /usr/local/nodejs/bin/nrm /usr/local/bin/nrm && \
    node -v && npm -v && npm config get prefix && nrm && \
    nrm use taobao && \
    yum -y install gcc gcc-c++  automake autoconf libtool make && \
    yum -y install curl-devel expat-devel gettext-devel openssl-devel zlib-devel && \
    yum remove -y git && \
    yum -y install python && \
    wget https://gitee.com/SpiritLing/git/repository/archive/v2.28.0?format=tar.gz && \
    mv v2.28.0?format=tar.gz git-2.28.0.tar.gz && \
    tar -zxvf git-2.28.0.tar.gz && \
    cd git && make configure && \
    ./configure --prefix=/usr/local/git && \
    make && make install && \
    export PATH="/usr/local/git/bin:$PATH" && \
    source /etc/profile && \
    ln -s /usr/local/git/bin/git /usr/bin/git && \
    cd .. && \
    rm -rf ./* && \

WORKDIR /home/nodeuser

CMD [ "node" ]
