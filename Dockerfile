FROM centos:7

WORKDIR /home/install

RUN yum install -y wget && \
    wget https://npm.taobao.org/mirrors/node/v10.15.3/node-v10.15.3-linux-x64.tar.gz && \
    tar xf node-v10.15.3-linux-x64.tar.gz -C /usr/local/ && \
    mv /usr/local/node-v10.15.3-linux-x64/ /usr/local/nodejs && \
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
    wget https://gitee.com/SpiritLing/git/repository/archive/v2.26.2?format=tar.gz && \
    mv v2.26.2?format=tar.gz git-2.26.2.tar.gz && \
    tar -zxvf git-2.26.2.tar.gz && \
    cd git && make configure && \
    ./configure --prefix=/usr/local/git && \
    make && make install && \
    export PATH="/usr/local/git/bin:$PATH" && \
    source /etc/profile && \
    ln -s /usr/local/git/bin/git /usr/bin/git && \
    cd .. && \
    rm -rf ./* && \
    yum remove -y gcc gcc-c++  automake autoconf libtool make curl-devel expat-devel gettext-devel openssl-devel zlib-devel

WORKDIR /home/nodeuser

CMD [ "node" ]