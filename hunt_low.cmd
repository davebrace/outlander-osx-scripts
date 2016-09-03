# debuglevel 5

start:
  put stance set 41 40 100 100
  pause 0.5

  gosub use_nightstick
  gosub train_weap

  gosub use_knuckles
  gosub train_weap

  gosub use_2he
  gosub train_weap 

  gosub use_flail
  gosub train_weap

  goto end

swap_greaves:
  put .swap_greaves
  waitforre ^GREAVES SWAPPED
  return

use_flail:
  var weapon flail
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

train_weap:
  gosub swap_greaves
  put .hunt %weapon 5
  waitforre ^HUNT DONE
  echo *** %weapon MINDLOCKED ***
  pause 0.5
  return

end:
  echo *** Weapons Mind Locked! ***
  put #goto crossing
  waitforre ^YOU HAVE ARRIVED
  put #flash
