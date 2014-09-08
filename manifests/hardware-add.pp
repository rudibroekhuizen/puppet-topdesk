# == Class: topdesk::hardware-add
#
class topdesk::hardware-add (
  $arguments,
  $url,
  $username,
  $password,
  $soortid,
  $merkid,
  $budgethouderid,
  ){

  exec { 'hardware-add':
    command => "curl ${arguments} ${url} \
                --data-urlencode 'action=new' \
                --data-urlencode 'status=1' \
                --data-urlencode 'j_username=${username}' \
                --data-urlencode 'j_password=${password}' \
                \
                --data-urlencode 'field0=naam' \
                --data-urlencode 'value0=${fqdn}' \
                \
                --data-urlencode 'replacefield1=soortid' \
                --data-urlencode 'searchfield1=naam' \
                --data-urlencode 'searchvalue1=Server' \
                \
                --data-urlencode 'replacefield2=merkid' \
                --data-urlencode 'searchfield2=naam' \
                --data-urlencode 'searchvalue2=SuperMicro' \
                \
                --data-urlencode 'replacefield3=budgethouderid' \
                --data-urlencode 'searchfield3=naam' \
                --data-urlencode 'searchvalue3=AUT' \
                \
                --data-urlencode 'replacefield4=leverancierid' \
                --data-urlencode 'searchfield4=naam' \
                --data-urlencode 'searchvalue4=Ahead-IT' \
                \
                --data-urlencode 'replacefield5=configuratieid' \
                --data-urlencode 'searchfield5=naam' \
                --data-urlencode 'searchvalue5=C002306' \
                \
                --data-urlencode 'replacefield6=statusid' \
                --data-urlencode 'searchfield6=naam' \
                --data-urlencode 'searchvalue6=Onbekend' \
                \
                --data-urlencode 'save=true' ",
    path      => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    logoutput => true,
  }
 
}
