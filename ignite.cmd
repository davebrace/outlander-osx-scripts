ignite:
  gosub clear

  if "$righthand" = "Empty" then {
    pause 60
    goto ignite
  }

  if "$preparedspell" != "None" then {
    pause 30
    goto ignite
  }

  if $mana <= 80 then {
    pause 10
    goto ignite
  }

  gosub prep_ignite

  waitfor You feel fully prepared to cast your spell
  gosub cast

  goto disperse

prep_ignite:
  pause 0.5
  match return You trace a hasty sigil in the air, shaping the pattern of the Ignite spell
  matchre prep_ignite ...wait|Sorry, you may only type ahead
  match ignite You are already
  put prep ignite 52
  matchwait
  return

cast:
  pause 0.25
  match cast ...wait
  match return Tendrils of flame dart along your hand toward
  match release think you can manage to ignite another weapon at the moment
  match ignite backfires
  put cast $righthandnoun
  matchwait
  return

release:
  pause 0.25
  match release ...wait
  match ignite The warm feeling in your hand goes away
  put release ignite
  matchwait
  return

disperse:
  pause 1
  waitfor The warm feeling in your hand goes away.
  goto ignite

