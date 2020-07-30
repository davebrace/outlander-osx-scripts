tw:
  gosub clear

  if "$preparedspell" != "None" then {
    pause 6
    goto tw
  }

  if $mana <= 70 then {
    pause 6
    goto tw
  }

  gosub prep_tw

  waitfor You feel fully prepared to cast your spell
  gosub cast

  goto disperse

prep_tw:
  pause 0.5
  matchre prep_tw ...wait|Sorry, you may only type ahead
  match return You trace a hasty sigil in the air, shaping the pattern of the Tailwind spell
  match tw You are already
  put prep tw 58
  matchwait
  return

cast:
  pause 0.25
  matchre cast ...wait|Sorry, you may only type ahead 1 command
  match return The wind begins to shift until it blows gently from behind your back.
  matchre tw backfires|are too mentally fatigued to finish the pattern
  put cast
  matchwait
  return

disperse:
  pause 1
  waitfor The shifting winds blowing from behind you die down.
  goto tw
