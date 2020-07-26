put #var train_stealth YES
put #var destination 33
put #var arrange_count 1
put #var exp_threshold 34

put .rm
pause 1

put .sw
pause 1

put .suf
pause 1

start:
  put rem greaves
  pause 2
  put stow greaves
  pause 1

  put get thick greaves
  put wear thick greaves
  pause 1.5

  gosub summon_nightstick
  gosub train_offhand_weap

  put break $righthand
  pause 2

  goto end

summon_nightstick:
  var weapon nightstick
  var skill staves

  if "$righthand" != "Empty" then {
    put shape $righthand to %skill
    pause 2
  } else {
    put summon weapon %skill
    pause 2

    put shape $righthand to fire
    pause 2
  }

  put turn $righthand
  pause 1.5

  return


train_summoned_weap:
  if "$righthand" != "Empty" then {
    put shape $righthand to %skill
    pause 2
  } else {
    put summon weapon %skill
    pause 2

    put shape $righthand to fire
    pause 2
  }
  
  gosub train_weap

  return

swap_greaves:
  put .swap_greaves
  waitforre ^GREAVES SWAPPED
  return

train_weap:
  put .hunt %weapon
  waitforre ^HUNT DONE
  echo *** %weapon finished ***
  pause 0.5
  return

train_offhand_weap:
  put .hunt offhand %weapon
  waitforre ^HUNT DONE
  echo *** Offhand finished ***
  put swap
  pause 0.5
  return

end:
  echo *** Finished training weapons ***

  put release cyclic
  put #script abort sw
  put #script abort suf
  put #script abort rm
  pause 0.5

  put #var powerwalk 1

  put .travel $destination
  waitfor TRAVEL DONE

  put #var powerwalk 0

  put #flash

  put .summon
  waitforre SUMMONING DONE

  put .arcana
  waitforre ARCANA DONE

  put .scholar
  waitforre SCHOLARSHIP DONE
