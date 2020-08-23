es:
  gosub clear

  if "$preparedspell" != "None" then {
    pause 30
    goto es
  }

  if $mana <= 85 then {
    pause 10
    goto es
  }

  gosub prep_es

  waitfor You feel fully prepared to cast your spell
  gosub cast

  goto disperse

prep_es:
  pause 0.5
  match return You trace a hasty sigil in the air, shaping the pattern of the Ethereal Shield spell
  matchre prep_es ...wait|Sorry, you may only type ahead
  match es You are already
  put prep es 62
  matchwait
  return

cast:
  pause 0.25
  matchre cast ...wait|Sorry, you may only type ahead 1 command
  match return A shimmering ethereal shield surrounds you.
  match es backfires
  put cast
  matchwait
  return

disperse:
  pause 1
  waitfor The shimmering ethereal shield fades from around you.
  goto es
