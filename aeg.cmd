aeg:
  gosub clear

  if "$preparedspell" != "None" then {
    pause 5
    goto aeg
  }

  if $mana <= 55 then {
    pause 5
    goto aeg
  }

  gosub prep_aeg
  gosub invoke

  waitfor You feel fully prepared to cast your spell
  gosub cast

  goto disperse

prep_aeg:
  pause 0.5
  match prep_aeg ...wait
  match return You trace a hasty sigil in the air, shaping the pattern of the Aegis of Granite spell
  match aeg You are already
  put prep aeg 340
  matchwait
  return

invoke:
  put #script pause hunt
  gosub lower_right
  gosub remove_clasp
  gosub invoke_clasp
  gosub wear_clasp
  gosub get_right
  put #script resume hunt
  return

lower_right:
  if "$righthand" != "Empty" then {
    var right_item $righthand
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
  match ...wait remove_clasp
  put remove clasp
  matchwait

wear_clasp:
  pause 0.1
  match return You put on a luminous
  match ...wait wear_clasp
  put wear clasp
  matchwait

invoke_clasp:
  pause 0.1
  match return You make sweeping
  match ...wait invoke_clasp
  put invoke clasp
  matchwait

cast:
  pause 0.25
  match cast ...wait
  match return You draw forth a pulse of dusky green Earth 
  match aeg backfires
  put cast
  matchwait

disperse:
  pause 1
  waitfor The Earth energy flows from your body
  goto aeg
