# debuglevel 5
var check_exp YES

start:
  put get pouch
  pause 0.5
  put wear pouch
  pause 0.5

  put stance set 65 65 53 100
  pause 0.5

  gosub use_2hb
  gosub train_weap

  gosub summon_quarter
  gosub train_weap
  gosub break_weapon

  gosub summon_polearm
  gosub train_weap
  gosub break_weapon

  gosub use_2he
  gosub train_weap 

  gosub use_broad
  gosub train_weap

  put stance set 100 0 83 100
  pause 0.5

  gosub use_ht
  gosub train_thrown_weap

  gosub use_brawling
  gosub train_weap

  gosub train_magic

  goto end

swap_greaves:
  put .swap_greaves
  waitforre ^GREAVES SWAPPED
  return

use_ht:
  var weapon mallet
  var summon NO
  var skill HT
  return

summon_quarter:
  var skill staves
  var weapon quarterstaff

  put summon weapon %skill
  pause 3

  put shape %weapon to fire
  pause 2

  return

summon_polearm:
  var skill polearm
  var weapon lance

  put summon weapon %skill
  pause 3

  put shape %weapon to fire
  pause 2

  return

break_weapon:
  put break my %weapon
  pause 2
  return

train_summoned:
  var skill %1
  var weapon %2

  put summon weapon %skill
  pause 3

  put shape %weapon to electric
  pause 3

  gosub train_weap

  put break %weapon
  pause 0.5

  return

use_broad:
  var weapon broadsword
  var summon NO
  var skill HE
  return

use_2hb:
  var weapon flail
  var summon NO
  var skill "2HB"
  return

use_2he:
  var weapon sword
  var summon NO
  var skill "2HE"
  return

use_brawling:
  var weapon Brawling
  var summon NO
  var skill Brawling
  return

train_thrown_weap:
  gosub swap_greaves
  put .hunt_throw %weapon 
  waitforre ^HUNT DONE
  echo *** %weapon MINDLOCKED ***
  pause 0.5
  return

train_weap:
  gosub swap_greaves
  put .hunt %weapon 
  waitforre ^HUNT DONE
  echo *** %weapon MINDLOCKED ***
  pause 0.5
  return

train_magic:
  put .hunt_magic
  waitforre ^HUNT DONE
  pause 0.5
  return

end:
  echo *** Weapons Mind Locked! ***
  put release cyclic
  pause 0.5
  put #goto 199
  waitforre ^YOU HAVE ARRIVED
  put #flash
