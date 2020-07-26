es:
  gosub clear

  if "$preparedspell" != "None" then {
    pause 30
    goto es
  }

  if $mana <= 90 then {
    pause 30
    goto es
  }

  gosub prep_es

  waitfor You feel fully prepared to cast your spell
  gosub cast

  goto disperse

prep_es:
  pause 0.5
  match prep_es ...wait
  match return You trace a hasty sigil in the air, shaping the pattern of the Ethereal Shield spell
  match es You are already
  put prep es 47
  matchwait
  return

cast:
  pause 0.25
  match cast ...wait
  match return A shimmering ethereal shield surrounds you.
  match es backfires
  put cast
  matchwait
  return

disperse:
  pause 1
  waitfor The shimmering ethereal shield fades from around you.
  goto es
