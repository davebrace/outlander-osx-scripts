var mana 50

var min_prep 15
var charge_amount %mana
math charge_amount subtract %min_prep

rm:
  gosub clear

  if "$preparedspell" != "None" then {
    pause 5
    goto rm
  }

  if $mana <= 35 then {
    pause 5
    goto rm
  }

  gosub prep_rm
  gosub charge
  gosub invoke

  waitfor You feel fully prepared to cast your spell
  gosub cast

  goto disperse

prep_rm:
  pause 0.5
  match return You trace a hasty sigil in the air, shaping the pattern of the Rising Mists spell
  matchre prep_rm ...wait|Sorry, you may only type ahead
  match rm You are already
  put prep rm %min_prep
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
  matchre invoke but fail|accidentally attune yourself|...wait
  matchre return readying all of its mana|you only are able to attune yourself|manage to attune yourself exactly as you intended to|Your efforts are mostly successful|readying all of its energy for your use
  put invoke my cub %charge_amount
  matchwait 5
  gosub invoke
  return

cast:
  pause 0.25
  matchre cast ...wait
  match return A wispy, grey mist silently rises, droplet by droplet.
  matchre rm backfires|You don't have a spell prepared
  put cast
  matchwait 5
  gosub cast
  return

disperse:
  pause 1
  waitfor The unnatural fog breaks apart with the passing of an errant breeze
  goto rm
