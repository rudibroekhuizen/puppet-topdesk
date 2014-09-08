# == Class: topdesk::hardware-add
#
class topdesk::hardware-add (
  $url            = undef,
  $username       = undef,
  $password       = undef,
  $soortid        = undef, #Server
  $merkid         = undef, #SuperMicro
  $budgethouderid = undef, #AUT
  ){

  exec { 'hardware-add':
    command => "curl -s -G ${url} \
                --data-urlencode 'action=new' \
                --data-urlencode 'status=1' \
                --data-urlencode 'j_username=${username}' \
                --data-urlencode 'j_password=${password}' \
                --data-urlencode 'field0=naam' \                    #Object ID
                --data-urlencode 'value0=${hostname}' \
                --data-urlencode 'replacefield1=soortid' \          #Soort
                --data-urlencode 'searchfield1=naam' \
                --data-urlencode 'searchvalue1=Server' \
                --data-urlencode 'replacefield2=merkid' \           #Merk
                --data-urlencode 'searchfield2=naam' \
                --data-urlencode 'searchvalue2=SuperMicro' \
                --data-urlencode 'replacefield3=budgethouderid' \
                --data-urlencode 'searchfield3=naam' \
                --data-urlencode 'searchvalue3=AUT' \
                --data-urlencode 'replacefield4=leverancierid' \    #Leverancier
                --data-urlencode 'searchfield4=naam' \
                --data-urlencode 'searchvalue4=Acanthis' \
                --data-urlencode 'replacefield5=configuratieid' \   #Configuratie ID
                --data-urlencode 'searchfield5=naam' \
                --data-urlencode 'searchvalue5=C002306' \
                --data-urlencode 'replacefield6=statusid' \         #Status
                --data-urlencode 'searchfield6=naam' \
                --data-urlencode 'searchvalue6=Onbekend' \
                --data-urlencode 'save=true' ",
    path      => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    logoutput => true,
  }
 
}
