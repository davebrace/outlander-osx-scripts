var mana 50

var min_prep 15
var charge_amount %mana
math charge_amount subtract %min_prep

etf:
  gosub clear

  if "$preparedspell" != "None" then {
    pause 20
    goto etf
  }

  if $mana <= 65 then {
    pause 10
    goto etf
  }

  gosub prep_etf
  gosub charge
  gosub invoke

  waitfor You feel fully prepared to cast your spell
  gosub cast

  goto disperse

prep_etf:
  pause 0.5
  match return You trace a hasty sigil in the air, shaping the pattern of the Ethereal Fissure spell
  matchre prep_etf ...wait
  match etf You are already
  put prep etf %min_prep
  matchwait 5
  goto etf

cast:
  pause 0.25
  match cast ...wait
  match return A spinning ball of vivid blue aether appears within the pattern your hands define.
  matchre etf backfires|You don't have a spell prepared!
  put cast fire
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
  matchre invoke but fail|accidentally attune yourself|...wait
  matchre return readying all of its mana|you only are able to attune yourself|manage to attune yourself exactly as you intended to|Your efforts are mostly successful|readying all of its energy for your use
  put invoke my cub %charge_amount
  matchwait 5
  gosub invoke
  return

disperse:
  pause 1
  waitfor fissure collapses in on itself, winking out of existence.
  goto etf
