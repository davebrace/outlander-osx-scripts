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
  match return You trace a hasty sigil in the air, shaping the pattern of the Rising Mists spell
  matchre prep_rm ...wait|Sorry, you may only type ahead
  match rm You are already
  put prep rm 38
  matchwait
  return

cast:
  pause 0.25
  matchre cast ...wait|Sorry, you may only type ahead 1 command
  match return A wispy, grey mist silently rises, droplet by droplet.
  match rm backfires
  put cast
  matchwait
  return

disperse:
  pause 1
  waitfor The unnatural fog breaks apart with the passing of an errant breeze
  goto rm
