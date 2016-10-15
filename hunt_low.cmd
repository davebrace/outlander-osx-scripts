# debuglevel 5

start:
  put stance set 65 67 50 100
  pause 0.5

  gosub use_flail
  gosub train_weap

  gosub use_2he
  gosub train_weap 

  gosub use_nightstick
  gosub train_weap

  gosub use_knuckles
  gosub train_weap

  put stance set 100 0 82 100
  pause 0.5

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
  put .hunt %weapon $arrange
  waitforre ^HUNT DONE
  echo *** %weapon MINDLOCKED ***
  pause 0.5
  return

end:
  echo *** Weapons Mind Locked! ***
  put release cyclic
  pause 0.5
  put #goto $destination
  waitforre ^YOU HAVE ARRIVED
  put #flash
