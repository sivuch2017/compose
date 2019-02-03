FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

# Repository
RUN sed -i -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.iij.ad.jp/pub/linux/ubuntu/archive/%g" /etc/apt/sources.list

# Base
RUN apt-get update && \
    apt-get install -y locales tzdata sudo less openssh-server && \
    mkdir /var/run/sshd && \
    echo 'root:root' | chpasswd && \
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo "X11UseLocalhost no" >> /etc/ssh/sshd_config && \
    echo "Ciphers  3des-cbc,aes128-cbc,aes192-cbc,aes256-cbc,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com,arcfour,arcfour128,arcfour256,blowfish-cbc,cast128-cbc,chacha20-poly1305@openssh.com" >> /etc/ssh/sshd_config && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    echo 'Asia/Tokyo' > /etc/timezone && \
    date && \
    echo 'LC_ALL=ja_JP.UTF-8' > /etc/default/locale && \
    echo 'LANG=ja_JP.UTF-8' >> /etc/default/locale && \
    locale-gen ja_JP.UTF-8 && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean
ENV LC_CTYPE ja_JP.UTF-8

# Upstart and DBus
RUN dpkg-divert --local --rename --add /sbin/initctl && ln -sf /bin/true /sbin/initctl

# User
RUN groupadd -g 1000 developer && \
    useradd -g developer -G sudo -m -s /bin/bash dev && \
    echo 'dev:dev' | chpasswd
COPY dot.bash_profile /home/dev/.bash_profile
RUN chown dev:developer /home/dev/.bash_profile && \
    chmod -x /home/dev/.bash_profile

# X
RUN apt-get update && \
    apt-get install -y ibus-mozc dbus-x11 fonts-vlgothic x11-apps x11-xserver-utils && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

# VSCode
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg git --no-install-recommends && \
    curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | apt-key add - && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list && \
    apt-get update && \
    apt-get install -y code=1.24.1-1528912196 libasound2 libatk1.0-0 libcairo2 libcups2 libexpat1 libfontconfig1 libfreetype6 libgtk2.0-0 libpango-1.0-0 libx11-xcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
