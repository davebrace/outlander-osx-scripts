var mana 72

var min_prep 1
var charge_amount %mana
math charge_amount subtract %min_prep

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
  gosub charge
  gosub invoke

  waitfor You feel fully prepared to cast your spell
  gosub cast

  goto disperse

prep_es:
  pause 0.5
  match return You trace a hasty sigil in the air, shaping the pattern of the Ethereal Shield spell
  matchre prep_es ...wait
  match es You are already
  put prep es %min_prep
  matchwait 5
  goto es
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
  matchre invoke but fail|accidentally attune yourself|...wait
  matchre return readying all of its mana|you only are able to attune yourself|manage to attune yourself exactly as you intended to|Your efforts are mostly successful|readying all of its energy for your use
  put invoke my cub %charge_amount
  matchwait 5
  gosub invoke
  return

cast:
  pause 0.25
  match cast ...wait
  matchre return A shimmering ethereal shield surrounds you.|The ethereal shield surrounding you shimmers slightly.
  match es backfires
  put cast
  matchwait 5
  gosub cast
  return

disperse:
  pause 1
  waitfor The shimmering ethereal shield fades from around you.
  goto es
