# debuglevel 5

start:
  put stance set 65 67 50 100
  pause 0.5

  gosub use_quarterstaff
  gosub train_weap

  gosub use_2he
  gosub train_weap 

  gosub use_2hb
  gosub train_weap

  # gosub train_tactics

  gosub use_knuckles
  gosub train_weap

  put stance set 100 0 82 100
  pause 0.5

  goto end

train_tactics:
  put .tactics
  waitforre ^TACTICS COMPLETE
  return

swap_greaves:
  put .swap_greaves
  waitforre ^GREAVES SWAPPED
  return

use_2hb:
  var weapon flail
  var summon NO
  var skill "2HB"
  return

use_quarterstaff:
  var weapon quarterstaff
  var summon YES
  var skill staves
  return

use_2he:
  var weapon sword
  var summon NO
  var skill "2HE"
  return

use_knuckles:
  var weapon knuckles
  var summon NO
  var skill Brawling
  return

train_weap:
  gosub swap_greaves
  put .hunt %weapon %summon %skill
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
