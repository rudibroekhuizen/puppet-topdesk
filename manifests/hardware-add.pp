# == Define: topdesk::hardware-add
#
define topdesk::hardware-add (
  $username       = undef,
  $password       = undef,
  #$soortid        = undef, #Server
  #$merkid         = undef, #SuperMicro
  #$budgethouderid = undef, #AUT
    
  ) {
  exec { '$title':
    command => 'curl -s -G http://topdesk/tas/secure/hardware? \
                --data-urlencode "action=new" \
                --data-urlencode "status=1" \
                --data-urlencode "j_username=${username}" \
                --data-urlencode "j_password=${password}" \
                --data-urlencode "replacefield0=soortid" \
                --data-urlencode "searchfield0=naam" \
                --data-urlencode "searchvalue0=Server" \
                --data-urlencode "replacefield1=merkid" \
                --data-urlencode "searchfield1=naam" \
                --data-urlencode "searchvalue1=SuperMicro" \
                --data-urlencode "replacefield2=budgethouderid" \
                --data-urlencode "searchfield2=naam" \
                --data-urlencode "searchvalue2=AUT" \
                --data-urlencode "replacefield3=leverancierid" \
                --data-urlencode "searchfield3=naam" \
                --data-urlencode "searchvalue3=Acanthis" \
                --data-urlencode "replacefield5=configuratieid" \
                --data-urlencode "searchfield5=naam" \
                --data-urlencode "searchvalue5=C002306" \
                --data-urlencode "field4=naam" \
                --data-urlencode "value4=dummy16.verwijdermij" \
                --data-urlencode "replacefield6=statusid" \
                --data-urlencode "searchfield6=naam" \
                --data-urlencode "searchvalue6=Onbekend" \
                --data-urlencode "save=true" ',
    path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',

  }
}
