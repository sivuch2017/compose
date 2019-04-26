<?php
$config->custom->debug['level'] = 0;
$config->custom->debug['syslog'] = true;
#$config->custom->debug['file'] = '/tmp/pla_debug.log';
$config->custom->jpeg['tmpdir'] = '/var/www/tmp';
#$config->custom->session['blowfish'] = 'c1*gF{XAWF[GB`Pg7GF/G8#9X 3.H9Kd!Fj.eGcODZ_HB1k#ny{d7w;/31bU0vmx';
$config->custom->appearance['hide_template_warning'] = true;
$config->custom->appearance['friendly_attrs'] = array(
        'facsimileTelephoneNumber' => 'Fax',
        'gid'                      => 'Group',
        'mail'                     => 'Email',
        'telephoneNumber'          => 'Telephone',
        'uid'                      => 'User Name',
        'userPassword'             => 'Password'
);
$servers = new Datastore();
$servers->newServer('ldap_pla');
$servers->setValue('server','name','localhost');
$servers->setValue('server','host','localhost');
?>
