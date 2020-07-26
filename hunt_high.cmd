var check_exp YES

put #var train_stealth NO
put #var destination 33
put #var arrange_count 0
put #var exp_threshold 34

put .mof
pause 0.5
put .sw
pause 0.5
put .suf
pause 0.5
put .ignite
pause 0.5
put .etf
pause 0.5
put .es
pause 0.5

start:
  put get pouch
  pause 0.5
  put wear pouch
  pause 0.5

  put stance set 62 60 63 100
  pause 0.5

  gosub use_dagesse
  gosub train_weap
  put stow dagesse
  pause 0.5

  gosub use_maul
  gosub train_weap
  put put maul in harness
  pause 0.5

  gosub use_polearm 
  gosub train_weap
  put put voulge in harness
  pause 0.5

  gosub summon_weapon

  gosub summon_quarter
  gosub train_weap

  gosub break_weapon

  gosub use_2he 
  gosub train_weap 
  put put flamberge in harness
  pause 0.5

  put stance set 100 0 85 100
  pause 0.5

  gosub use_ht
  gosub train_weap
  put stow hammer

  put stance set 62 60 63 100
  pause 0.5

  gosub use_brawling
  gosub train_weap

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

use_dagesse:
  var weapon dagesse
  var skill large edged
  put get my dagesse
  pause 0.5
  return

use_maul:
  var weapon maul
  var skill Twohanded Blunt
  put get my maul
  pause 0.5
  return

use_ht:
  var weapon hammer
  var skill heavy thrown
  put get throwing hammer
  pause 0.5
  return

summon_quarter:
  var skill staves
  var weapon quarterstaff

  put shape $righthand to %skill
  pause 2

  return

use_polearm:
  var skill polearm
  var weapon voulge
  return

break_weapon:
  put break my %weapon
  pause 2
  return

use_2he:
  var weapon flamberge
  var skill Twohanded Edged
  return

use_brawling:
  var weapon Brawling
  var summon NO
  var skill Brawling
  return

train_weap:
  gosub swap_greaves
  put .hunt %weapon 
  waitforre ^HUNT DONE
  echo *** %weapon MINDLOCKED ***
  pause 0.5
  return

train_magic:
  put #script abort sw
  put #script abort suf
  put #script abort mof
  put #script abort ignite
  put #script abort es
  put .hunt_magic
  waitforre ^HUNT DONE
  pause 0.5
  return
  

end:
  echo *** Weapons Mind Locked! ***
  put #var powerwalk 1
  put #script abort sw
  put #script abort suf
  put #script abort mof
  put #script abort ignite
  put #script abort etf
  put #script abort es

  put release cyclic
  pause 0.5
  put look
  put .travel $destination
  waitfor TRAVEL DONE
  put #var powerwalk 0
  put #flash
  put .summon
  waitforre SUMMONING DONE
  put .scholar
  waitforre SCHOLARSHIP DONE
  put .arcana
  waitforre ARCANA DONE
