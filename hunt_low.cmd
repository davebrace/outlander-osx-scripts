# debuglevel 5

put #var train_stealth NO
put #var destination 33
put #var arrange_count 1
put #var exp_threshold 34

put .mof
pause 1
put .sw
pause 1
put .suf
pause 1
put .etf
pause 1
put .es
pause 1

start:
  put rem greaves
  pause 2
  put stow greaves
  pause 1

  put get thick greaves
  put wear thick greaves
  pause 2

  put .ignite
  pause 1

  put summon weapon
  pause 2

  put shape $righthand to fire
  pause 2

  put stance set 62 60 63 100
  pause 0.5

  var skill small blunt
  var weapon mallet
  gosub train_summoned_weap

  var skill large blunt
  var weapon hara
  gosub train_summoned_weap

  put break $righthand
  pause 2

  var skill small edged
  var weapon hanger
  gosub train_weap
  put stow hanger
  pause 0.5

  put stance set 100 0 85 100
  pause 0.5

  var skill light thrown
  var weapon club
  gosub train_weap
  put stow club
  pause 0.25

  put #script abort ignite
  pause 1

  put stance set 100 0 85 100
  pause 0.5

  put #var exp_threshold 32

  gosub use_shortbow
  gosub train_weap
  put stow shortbow

  gosub use_stonebow
  gosub train_weap 
  put stow stonebow
  pause 0.5

  gosub use_sling
  gosub train_weap
  put wear slingshot
  pause 0.5

  goto end

use_sling:
  var weapon sling
  var skill sling
  return

use_shortbow:
  var weapon shortbow
  var skill bow
  return

use_stonebow:
  var weapon stonebow
  var skill stonebow
  return

train_summoned_weap:
  if "$righthand" != "Empty" then {
    put shape $righthand to %skill
    pause 2
  } else {
    put summon weapon %skill
    pause 2

    put shape $righthand to fire
    pause 1.5

    put pull $righthand
    pause 1.5
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
  echo *** %weapon MINDLOCKED ***
  pause 0.5
  return

end:
  echo *** Weapons Mind Locked! ***
  put release cyclic
  put #script abort sw
  put #script abort suf
  put #script abort mof
  put #script abort es
  put #script abort etf
  pause 0.5
  put #var powerwalk 1
  put #goto $destination
  waitforre ^YOU HAVE ARRIVED
  put #var powerwalk 0
  put #flash
