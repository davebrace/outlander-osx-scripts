# debuglevel 5
var check_exp YES

put #var train_stealth NO
put #var destination Riverhaven
put #var arrange_count 0

start:
  put get pouch
  pause 0.5
  put wear pouch
  pause 0.5

  put stance set 100 0 84 100
  pause 0.5

  gosub use_ht
  gosub train_thrown_weap
  put stow mallet

  put stance set 62 60 62 100
  pause 0.5

  gosub use_brawling
  gosub train_weap

  gosub summon_weapon

  gosub summon_broad
  gosub train_weap

  gosub summon_quarter
  gosub train_weap

  gosub summon_polearm
  gosub train_weap

  gosub summon_maul
  gosub train_weap

  gosub summon_blade
  gosub train_weap 

  gosub break_weapon

  gosub train_magic

  goto end

summon_weapon:
  put summon weapon
  pause 2

  put shape $righthand to fire
  pause 2

  return


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

  put shape $righthand to %skill
  pause 2

  return

summon_polearm:
  var skill polearm
  var weapon lance

  put shape $righthand to %skill
  pause 2

  return

break_weapon:
  put break my %weapon
  pause 2
  return

summon_broad:
  var weapon broadsword
  var skill Large Edged

  put shape $righthand to %skill
  pause 2

  return

summon_maul:
  var weapon maul
  var skill Twohanded Blunt

  put shape $righthand to %skill
  pause 2

  put push my maul
  pause 1.5

  return

summon_blade:
  var weapon blade
  var skill Twohanded Edged

  put shape $righthand to %skill
  pause 2

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
  put #var powerwalk 1
  put #goto $destination
  waitforre ^YOU HAVE ARRIVED
  put #var powerwalk 0
  put #flash
