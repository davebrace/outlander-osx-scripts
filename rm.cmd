rm:
  gosub clear

  if "$preparedspell" != "None" then {
    pause 5
    goto rm
  }

  if $mana <= 35 then {
    pause 5
    goto rm
  }

  gosub prep_rm

  waitfor You feel fully prepared to cast your spell
  gosub cast

  goto disperse

prep_rm:
  pause 0.5
  match prep_rm ...wait
  match return You trace a hasty sigil in the air, shaping the pattern of the Rising Mists spell
  match rm You are already
  put prep rm 32
  matchwait
  return

cast:
  pause 0.25
  match cast ...wait
  match return A wispy, grey mist silently rises, droplet by droplet.
  match rm backfires
  put cast
  matchwait
  return

disperse:
  pause 1
  waitfor The unnatural fog breaks apart with the passing of an errant breeze
  goto rm
