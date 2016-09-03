# debuglevel 5

start:
  put stance set 65 66 50 100
  pause 0.5

  gosub use_glaive
  gosub train_weap

  gosub use_broad
  gosub train_weap

  put stance set 100 0 81 100
  pause 0.5

  gosub use_ht
  gosub train_thrown_weap

  goto end

swap_greaves:
  put .swap_greaves
  waitforre ^GREAVES SWAPPED
  return

use_ht:
  var weapon mallet
  return

use_glaive:
  var weapon glaive
  return

use_broad:
  var weapon broadsword
  return

use_nightstick:
  var weapon nightstick
  return

use_2he:
  var weapon sword
  return

use_knuckles:
  var weapon knuckles
  return

train_thrown_weap:
  gosub swap_greaves
  put .hunt_throw %weapon 1
  waitforre ^HUNT DONE
  echo *** %weapon MINDLOCKED ***
  pause 0.5
  return

train_weap:
  gosub swap_greaves
  put .hunt %weapon 1
  waitforre ^HUNT DONE
  echo *** %weapon MINDLOCKED ***
  pause 0.5
  return

end:
  echo *** Weapons Mind Locked! ***
  put #goto crossing
  waitforre ^YOU HAVE ARRIVED
  put #flash
