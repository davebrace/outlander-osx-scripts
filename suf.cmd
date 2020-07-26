suf:
  gosub clear

  if "$preparedspell" != "None" then {
    pause 6
    goto suf
  }

  if $mana <= 70 then {
    pause 6
    goto suf
  }

  gosub prep_suf

  waitfor You feel fully prepared to cast your spell
  gosub cast

  goto disperse

prep_suf:
  pause 0.5
  match prep_suf ...wait
  match return You trace a hasty sigil in the air, shaping the pattern of the Sure Footing spell
  match suf You are already
  put prep suf 56
  matchwait
  return

cast:
  pause 0.25
  match cast ...wait
  match return You feel steadier.
  matchre suf backfires|are too mentally fatigued to finish the pattern
  put cast
  matchwait
  return

disperse:
  pause 1
  waitfor You feel less steady, and realize that your Sure Footing spell has worn off. 
  goto suf
