#!/usr/bin/env sh
if [[ -n "$PHPLDAPADMIN_LDAP_HOST" ]]; then
  sed -i "s/setValue('server','host','localhost')/setValue('server','host','`echo $PHPLDAPADMIN_LDAP_HOST | sed 's#\/#\\\/#g'`')/" /etc/phpldapadmin/config.php
  sed -i "s/setValue('server','name','localhost')/setValue('server','name','`echo $PHPLDAPADMIN_LDAP_HOST | sed 's#\/#\\\/#g'`')/" /etc/phpldapadmin/config.php
fi
httpd -D FOREGROUND
