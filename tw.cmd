var mana 75

var min_prep 5
var charge_amount %mana
math charge_amount subtract %min_prep

tw:
  gosub clear

  if "$preparedspell" != "None" then {
    pause 30
    goto tw
  }

  if $mana <= 75 then {
    pause 10
    goto tw
  }

  gosub prep_tw
  gosub charge
  gosub invoke

  waitfor You feel fully prepared to cast your spell
  gosub cast

  goto disperse

prep_tw:
  pause 0.5
  match return You trace a hasty sigil in the air, shaping the pattern of the Tailwind spell
  match tw You are already
  matchre prep_tw ...wait|Sorry, you may only type ahead
  put prep tw %min_prep
  matchwait
  return

cast:
  pause 0.25
  match return The wind begins to shift until it blows gently from behind your back.
  matchre tw backfires|are too mentally fatigued to finish the pattern
  matchre cast ...wait|Sorry, you may only type ahead 1 command
  put cast
  matchwait
  return

charge:
  pause 0.25
  matchre return You harness
  matchre charge ...wait
  put charge my cub %charge_amount
  matchwait 5
  gosub charge
  return

invoke:
  pause 0.25
  matchre invoke but fail|...wait
  matchre return readying all of its mana|you only are able to attune yourself|manage to attune yourself exactly as you intended to|Your efforts are mostly successful|readying all of its energy for your use
  put invoke my cub %charge_amount
  matchwait 5
  gosub invoke
  return

disperse:
  pause 1
  waitfor The shifting winds blowing from behind you die down.
  goto tw
