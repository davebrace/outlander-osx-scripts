#debuglevel 5

top:
 if_1 then {
  gosub travel %1
    shift
    pause 1
  } else {
  goto end
 }
goto top

end:
done:
 put #parse ** TRAVEL DONE **
 exit

####  COMMON Subroutines  ####
travel:
 var destination $0
retravel:
 matchre retravel You can't go there\.|What were you referring to\?|You can't sneak in that direction\.
 matchre return You are already here\!|^YOU HAVE ARRIVED
 put #goto %destination
 matchwait
####
#### Return  ####
return:
 return
####
