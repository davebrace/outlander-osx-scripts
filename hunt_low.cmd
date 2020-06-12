# debuglevel 5

put #var train_stealth YES
put #var destination Riverhaven
put #var arrange_count 1

start:
  put rem greaves
  pause 2
  put stow greaves
  pause 1

  put get thick greaves
  put wear thick greaves
  pause 2

  put summon weapon
  pause 2

  put shape $righthand to fire
  pause 2

  put stance set 62 60 62 100
  pause 0.5

  var skill small edged
  var weapon scimitar
  gosub train_summoned_weap

  var skill large blunt
  var weapon hara
  gosub train_summoned_weap

  var skill small blunt
  var weapon mallet
  gosub train_summoned_weap

  put stance set 100 0 82 100
  pause 0.5

  var skill light thrown
  var weapon bola
  gosub train_thrown_summoned_weap

  put break $righthand
  pause 2

  put stance set 100 0 84 100
  pause 0.5

  gosub use_shortbow
  gosub train_weap
  put stow shortbow

  gosub use_crossbow
  gosub train_weap 
  put stow crossbow

  gosub use_sling
  gosub train_weap
  put stow sling

  goto end

use_sling:
  var weapon sling
  var skill sling
  return

use_shortbow:
  var weapon shortbow
  var skill bow
  return

use_crossbow:
  var weapon crossbow
  var skill crossbow
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

train_thrown_summoned_weap:
  put shape $righthand to %skill
  pause 2

  gosub train_thrown_weap

  return

swap_greaves:
  put .swap_greaves
  waitforre ^GREAVES SWAPPED
  return

train_weap:
  # gosub swap_greaves
  put .hunt %weapon
  waitforre ^HUNT DONE
  echo *** %weapon MINDLOCKED ***
  pause 0.5
  return

train_thrown_weap:
  # gosub swap_greaves
  put .hunt_throw %weapon 
  waitforre ^HUNT DONE
  echo *** %weapon MINDLOCKED ***
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
