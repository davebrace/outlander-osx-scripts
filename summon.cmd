# Simple script to max attunement
# debuglevel 5

start:
  put pathway focus defend
  pause 1
  goto summon

summon:
  var LAST summon
  gosub clear
  gosub check_exp
  matchre move_out so heavily embody|reached your limit
  matchre rt Roundtime|...wait
  put summon admittance 
  matchwait 
  goto summon

rt:
  pause
  goto %LAST

check_exp:
  if $Summoning.LearningRate > 32 then {
    put pathway stop 
  }
  return

move_out:
  put stand
  pause 0.5
  put #flash
  put #parse SUMMONING DONE
