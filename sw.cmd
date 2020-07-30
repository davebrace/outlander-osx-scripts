sw:
  gosub clear

  if "$preparedspell" != "None" then {
    pause 5
    goto sw
  }

  if $mana <= 55 then {
    pause 5
    goto sw
  }

  gosub prep_sw

  waitfor You feel fully prepared to cast your spell
  gosub cast

  goto disperse

prep_sw:
  pause 0.5
  match return You trace a hasty sigil in the air, shaping the pattern of the Swirling Winds spell
  matchre prep_sw ...wait|Sorry, you may only type ahead
  match sw You are already
  put prep sw 58
  matchwait
  return

cast:
  pause 0.25
  matchre cast ...wait|Sorry, you may only type ahead 1 command
  match return allowing you to dodge more easily
  matchre sw backfires|are too mentally fatigued to finish the pattern
  put cast
  matchwait
  return

disperse:
  pause 1
  waitfor You feel the winds surrounding you disperse. 
  goto sw
