etf:
  gosub clear

  if "$preparedspell" != "None" then {
    pause 20
    goto etf
  }

  if $mana <= 80 then {
    pause 10
    goto etf
  }

  gosub prep_etf

  waitfor You feel fully prepared to cast your spell
  gosub cast

  goto disperse

prep_etf:
  pause 0.5
  match prep_etf ...wait
  match return You trace a hasty sigil in the air, shaping the pattern of the Ethereal Fissure spell
  match etf You are already
  put prep etf 31
  matchwait
  return

cast:
  pause 0.25
  match cast ...wait
  match return A spinning ball of vivid blue aether appears within the pattern your hands define.
  match etf backfires
  put cast fire
  matchwait
  return

disperse:
  pause 1
  waitfor fissure collapses in on itself, winking out of existence.
  goto etf

