var check_exp YES

put #var train_stealth NO
put #var destination Hib
put #var arrange_count 0
put #var exp_threshold 34

put .aeg
put .delay_30 sw
pause 4
put .delay_60 suf
put .delay_90 etf
put .delay_120 ignite 
put .delay_150 es
put .delay_180 zephyr
put .delay_240 fb

start:
  put get pouch
  pause 0.5
  put wear pouch
  pause 0.5

  put stance set 100 0 86 100
  pause 0.5

  put .tw
  pause 0.5

  gosub use_ht
  gosub train_weap
  put stow hammer
  pause 0.5

  put #script abort tw

  put stance set 63 60 63 100
  pause 0.5

  gosub use_dagesse
  gosub train_weap
  put stow dagesse
  pause 0.5

  gosub use_2he 
  gosub train_weap 
  put put flamberge in harness
  pause 0.5

  gosub use_staff
  gosub train_weap
  put put staff in harness
  pause 0.5

  gosub use_polearm 
  gosub train_weap
  put put voulge in harness
  pause 0.5

  gosub use_maul
  gosub train_weap
  put put maul in harness
  pause 0.5

  gosub use_brawling
  gosub train_weap

  gosub train_magic

  goto end

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
  var weapon throwing hammer
  var skill heavy thrown
  put get throwing hammer
  pause 0.5
  return

use_staff:
  var weapon staff
  var skill staves
  put get staff
  pause 0.5
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
  put .hunt "%weapon"
  waitforre ^HUNT DONE
  echo *** %weapon MINDLOCKED ***
  pause 0.5
  return

train_magic:
  put #script abort sw
  put #script abort suf
  put #script abort aeg
  put #script abort ignite
  put #script abort es
  put #script abort tw
  put #script abort fb
  put #script abort zephyr
  put .hunt_magic
  waitforre ^HUNT DONE
  pause 0.5
  return
  

end:
  echo *** Weapons Mind Locked! ***
  put #var powerwalk 1
  put #script abort sw
  put #script abort suf
  put #script abort aeg
  put #script abort ignite
  put #script abort etf
  put #script abort es
  put #script abort tw
  put #script abort fb
  put #script abort zephyr

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
