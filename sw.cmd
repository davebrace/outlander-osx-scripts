var mana 77

var min_prep 5
var charge_amount %mana
math charge_amount subtract %min_prep

sw:
  gosub clear

  if "$preparedspell" != "None" then {
    pause 5
    goto sw
  }

  if $mana <= 67 then {
    pause 5
    goto sw
  }

  gosub prep_sw
  gosub charge
  gosub invoke

  waitfor You feel fully prepared to cast your spell
  gosub cast

  goto disperse

prep_sw:
  pause 0.5
  match return You trace a hasty sigil in the air, shaping the pattern of the Swirling Winds spell
  matchre prep_sw ...wait|Sorry, you may only type ahead
  match sw You are already
  put prep sw %min_prep
  matchwait 5
  goto sw
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

cast:
  pause 0.25
  match cast ...wait
  match return allowing you to dodge more easily
  matchre sw backfires|are too mentally fatigued to finish the pattern|You don't have a spell prepared!
  put cast
  matchwait 5
  gosub cast
  return

disperse:
  pause 1
  waitfor You feel the winds surrounding you disperse. 
  goto sw
