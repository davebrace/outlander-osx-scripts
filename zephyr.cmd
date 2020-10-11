var mana 64

var min_prep 5
var charge_amount %mana
math charge_amount subtract %min_prep

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
  gosub charge
  gosub invoke

  waitfor You feel fully prepared to cast your spell
  gosub cast

  goto disperse

prep_zephyr:
  pause 0.5
  match return You trace a hasty sigil in the air, shaping the pattern of the Zephyr spell
  match prep_zephyr ...wait
  match zephyr You are already
  put prep zephyr %min_prep
  matchwait 5
  goto zephyr
  return

cast:
  pause 0.25
  matchre cast ...wait
  matchre return breeze begins to stir.|There is already a stronger magical breeze blowing here.
  matchre zephyr backfires|You don't have a spell prepared
  put cast
  matchwait 5
  gosub cast
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
  waitfor With a final, swirling whisper, the breeze fades from the area. 
  goto zephyr
