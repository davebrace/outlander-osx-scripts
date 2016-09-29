start:
  gosub clear
  gosub check_exp

  put pathway focus damage
  
  pause 0.75

  put summon admit
  pause 0.75
  wait

  put summon admit
  pause 0.75
  wait

  put summon admit
  pause 0.75
  wait

  put summon weapon lance
  pause 0.75
  wait

  put break stone lance
  pause 0.75

  goto start
  

check_exp:
  if $Summoning.LearningRate >= 34 then goto move_out
  return

move_out:
  put pathway stop
  pause 0.5
  put stand
  put #parse SUMMONING DONE
  put #beep
