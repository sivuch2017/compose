FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN rm /etc/apt/apt.conf.d/docker-gzip-indexes && \
    apt-get -o Acquire::GzipIndexes=false update && \
    apt-get install -y --no-install-recommends \
       python \
       apt-show-versions \
       libapt-pkg-perl \
       libauthen-pam-perl \
       libio-pty-perl \
       libnet-ssleay-perl \
       curl \
       ca-certificates \
       libnss-ldap \
       libpam-ldap \
       ldap-utils && \
    curl -L -O http://www.webmin.com/download/deb/usermin-current.deb && \
    dpkg -i usermin-current.deb && \
    rm usermin-current.deb && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    { \
       echo "pam_account="; \
       echo "    account  [success=2  new_authtok_reqd=done default=ignore] pam_unix.so"; \
       echo "    account  [success=1  default=ignore] pam_ldap.so"; \
       echo "    account  requisite   pam_deny.so"; \
       echo "    account  required    pam_permit.so"; \
       echo "pam_auth="; \
       echo "    auth     [success=2 default=ignore] pam_unix.so nullok_secure"; \
       echo "    auth     [success=1 default=ignore] pam_ldap.so use_first_pass"; \
       echo "    auth     requisite   pam_deny.so"; \
       echo "    auth     required    pam_permit.so"; \
       echo "    auth     optional    pam_cap.so"; \
       echo "pam_password="; \
       echo "    password [success=2 default=ignore] pam_unix.so obscure sha512"; \
       echo "    password [success=1  user_unknown=ignore default=die] pam_ldap.so try_first_pass"; \
       echo "    password requisite   pam_deny.so"; \
       echo "    password required    pam_permit.so"; \
       echo "pam_session="; \
       echo "    session  [default=1] pam_permit.so"; \
       echo "    session  requisite   pam_deny.so"; \
       echo "    session  required    pam_permit.so"; \
       echo "    session  optional    pam_umask.so"; \
       echo "    session  required    pam_unix.so"; \
       echo "    session  optional    pam_ldap.so"; \
       echo "    session  optional    pam_mkhomedir.so skel=/etc/skel umask=077"; \
    } | tee -a /etc/auth-client-config/profile.d/ldap-auth-config && \
    sed -i \
       -e 's/base dc=example,dc=net/base dc=domain/' \
       -e 's#uri ldapi:///#uri ldap://192.168.10.1/#' \
       -e 's/#binddn cn=proxyuser,dc=padl,dc=com/binddn cn=admin,dc=domain/' \
       -e 's/#bindpw secret/bindpw admin/' \
       -e 's/rootbinddn cn=manager,dc=example,dc=net/#rootbinddn cn=manager,dc=example,dc=net/' \
    /etc/ldap.conf && \
    /usr/sbin/auth-client-config -a -p lac_ldap && \
    sed -i -e 's/passwd_cmd=file/passwd_cmd=/' /etc/usermin/changepass/config && \
    sed -i -e 's/lang=en.UTF-8/lang=ja_JP.UTF-8/' /etc/usermin/config && \
    echo "user: changepass language" > /etc/usermin/webmin.acl

EXPOSE 20000
CMD [ "/sbin/init" ]

