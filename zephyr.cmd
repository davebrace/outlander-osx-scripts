zephyr:
  gosub clear

  if "$preparedspell" != "None" then {
    pause 30
    goto zephyr
  }

  if $mana <= 85 then {
    pause 10
    goto zephyr
  }

  gosub prep_zephyr

  waitfor You feel fully prepared to cast your spell
  gosub cast

  goto disperse

prep_zephyr:
  pause 0.5
  match return You trace a hasty sigil in the air, shaping the pattern of the Zephyr spell
  matchre prep_zephyr ...wait|Sorry, you may only type ahead
  match zephyr You are already
  put prep zephyr 52
  matchwait
  return

cast:
  pause 0.25
  matchre cast ...wait|Sorry, you may only type ahead 1 command
  match return A light cool breeze begins to stir.
  match zephyr backfires
  put cast
  matchwait
  return

disperse:
  pause 1
  waitfor With a final, swirling whisper, the breeze fades from the area. 
  goto zephyr
