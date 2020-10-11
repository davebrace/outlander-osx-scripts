mof:
  gosub clear

  if "$preparedspell" != "None" then {
    pause 5
    goto mof
  }

  if $mana <= 50 then {
    pause 5
    goto mof
  }

  gosub prep_mof
  gosub invoke

  waitfor You feel fully prepared to cast your spell
  gosub cast

  goto disperse

prep_mof:
  pause 0.5
  match return You trace a hasty sigil in the air, shaping the pattern of the Mantle of Flame spell
  match prep_mof ...wait
  match mof You are already
  put prep mof 410
  matchwait 5
  goto mof
  return

invoke:
  put #script pause hunt
  pause 1
  gosub lower_right
  gosub remove_clasp
  gosub invoke_clasp
  gosub wear_clasp
  gosub get_right
  put #script resume hunt
  put aim
  pause 0.5
  return

lower_right:
  if "$righthand" != "Empty" then {
    var right_item $righthandnoun
    matchre return You lower
    matchre lower_right ...wait
    put lower %right_item ground
    matchwait
  } else {
    var right_item Empty
  }
  return

get_right:
  if "%right_item" != "Empty" then {
    matchre return You pick up
    matchre get_right ...wait
    put get %right_item
    matchwait
  }
  return

remove_clasp:
  pause 0.1
  match return You take off a luminous
  match remove_clasp ...wait 
  put remove clasp
  matchwait

wear_clasp:
  pause 0.1
  match return You put on a luminous
  match wear_clasp ...wait
  put wear clasp
  matchwait 5
  gosub wear_clasp
  return

invoke_clasp:
  pause 0.1
  match return You make sweeping
  match invoke_clasp ...wait
  put invoke clasp
  matchwait 5
  gosub invoke_clasp
  return

cast:
  pause 0.25
  matchre cast ...wait
  match return A crackling mantle of blazing orange-yellow flames surrounds you
  matchre mof backfires|You don't have a spell prepared
  put cast
  matchwait 5
  gosub cast
  return

disperse:
  pause 1
  waitfor Your body is no longer imbued with Fire
  goto mof
