var mana 64

var min_prep 5
var charge_amount %mana
math charge_amount subtract %min_prep

ignite:
  gosub clear

  if "$righthand" = "Empty" then {
    pause 60
    goto ignite
  }

  if "$preparedspell" != "None" then {
    pause 35
    goto ignite
  }

  if $mana <= 80 then {
    pause 10
    goto ignite
  }

  gosub prep_ignite
  gosub charge
  gosub invoke

  waitfor You feel fully prepared to cast your spell
  gosub cast

  goto disperse

prep_ignite:
  pause 0.5
  match return You trace a hasty sigil in the air, shaping the pattern of the Ignite spell
  matchre prep_ignite ...wait|Sorry, you may only type ahead
  match ignite You are already
  put prep ignite %min_prep
  matchwait
  return

cast:
  pause 0.25
  match cast ...wait
  match return Tendrils of flame dart along your hand toward
  match release think you can manage to ignite another weapon at the moment
  matchre ignite backfires|You can't cast that on|You don't have a spell prepared
  put cast $righthandnoun
  matchwait 5
  goto ignite
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

