var mana 75

var min_prep 5
var charge_amount %mana
math charge_amount subtract %min_prep

suf:
  gosub clear

  if "$preparedspell" != "None" then {
    pause 6
    goto suf
  }

  if $mana <= 69 then {
    pause 6
    goto suf
  }

  gosub prep_suf
  gosub charge
  gosub invoke

  waitfor You feel fully prepared to cast your spell
  gosub cast

  goto disperse

prep_suf:
  pause 0.5
  match return You trace a hasty sigil in the air, shaping the pattern of the Sure Footing spell
  matchre prep_suf ...wait
  match suf You are already
  put prep suf %min_prep
  matchwait 5
  goto suf
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
  matchre cast ...wait
  match return You feel steadier.
  matchre suf backfires|are too mentally fatigued to finish the pattern
  put cast
  matchwait
  return

disperse:
  pause 1
  waitfor You feel less steady, and realize that your Sure Footing spell has worn off. 
  goto suf
