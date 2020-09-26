put #var train_stealth YES
put #var destination Hib
put #var arrange_count 1
put #var exp_threshold 34

put .rm
put .delay_30 sw
put .delay_60 suf
put .delay_150 es

start:
  put rem greaves
  pause 3
  put stow greaves
  pause 1

  put get thick greaves
  pause 0.5
  put wear thick greaves
  pause 1.5

  gosub summon_nightstick
  gosub train_offhand_weap
  put put nightstick in my shadow

  goto end

summon_nightstick:
  var weapon nightstick
  var skill staves
  put get my nightstick
  pause 0.5
  return

swap_greaves:
  put .swap_greaves
  waitforre ^GREAVES SWAPPED
  return

train_weap:
  put .hunt %weapon
  waitforre ^HUNT DONE
  echo *** %weapon finished ***
  pause 0.5
  return

train_offhand_weap:
  put .hunt offhand %weapon
  waitforre ^HUNT DONE
  echo *** Offhand finished ***
  put swap
  pause 0.5
  return

end:
  echo *** Finished training weapons ***

  put release cyclic
  put #script abort sw
  put #script abort suf
  put #script abort rm
  put #script abort es
  pause 0.5

  put #var powerwalk 1

  put .travel $destination
  waitfor TRAVEL DONE

  put #var powerwalk 0

  put #flash

  put .summon
  waitforre SUMMONING DONE

  put .arcana
  waitforre ARCANA DONE

  put .scholar
  waitforre SCHOLARSHIP DONE
