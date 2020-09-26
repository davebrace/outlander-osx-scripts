# debuglevel 1

var cast_count 0

var skinnablecritters rat|hog|goblin|boar|eel|bobcat|cougar|reaver|wolf|snowbeast|gargoyle|togball|ape|tusky|wyvern|firecat|troll|crocodile|bear|ogre|leucro|lach|warcat|stalker|gryphon|darvager|leucro|deer

start:
  put .swap_greaves
  waitforre GREAVES SWAPPED

  put release cyclic

  put stance set 63 60 63 100
  pause 1

  goto debuff

debuff:
  gosub check_exp
  gosub clear
  var cast_count 0

  gosub cast_eth_fissure

  pause 0.5
  put pathway focus accuracy

  goto target

target:
  gosub health
  gosub check_exp
  gosub clear

  if %cast_count > 15 then goto debuff

  gosub prep_tm

cast_eth:
  put cast fire
  pause 0.5
  return

cast:
  math add %cast_count 1
  match return You gesture
  match cast ...wait
  put cast
  matchwait 1
  return

cast_eth_fissure:
  gosub set_charge_mana 33

  gosub check_mana

  put prep eth fissure 15

  gosub use_cambrinth

  matchre cast_eth You feel fully prepared
  matchwait 30 
  if "$preparedspell" != "None" then {
    gosub cast_eth
  }
  return

cast_tm:
  gosub use_cambrinth
  gosub harness_tm

  matchre cast You feel fully prepared|formation of a targeting pattern|target pattern has finished forming
  matchwait 4
  if "$preparedspell" != "None" then {
    gosub cast
  }
  goto check_loot

harness_tm:
  pause 0.25
  match return You tap into the mana
  match harness_tm ...wait
  put harness 16
  matchwait 5
  return

prep_tm:
  pause 0.5
  gosub set_charge_mana 24

  gosub check_mana

  gosub targ_tm

  return

targ_tm:
  matchre targ_tm ...wait
  matchre no_creature What are you trying to attack
  matchre cast_tm target pattern around|targeting pattern centered
  put targ fb 15
  matchwait 2

no_creature:
  if "$preparedspell" != "None" then {
    put release spell
  }
  echo *** No creatures to attack ***
  pause 10
  gosub check_loot
  return

set_spell:
  var spell_name $1
  return

set_prep_mana:
  var prep_mana $1
  return

set_charge_mana:
  var charge_mana $1
  return

set_spell_action:
  var spell_action $1
  return

use_cambrinth:
  put charge my cub %charge_mana
  pause 3 
  gosub invoke_cambrinth
  return

invoke_cambrinth:
  matchre invoke_cambrinth but fail|accidentally attune yourself|...wait
  matchre done readying all of its mana|you only are able to attune yourself|manage to attune yourself exactly as you intended to
  put invoke my cub %charge_mana
  matchwait 2
  return

done:
  return

check_exp:
  if $Targeted_Magic.LearningRate >= 34 then {
    goto end
  }
  return

skin:
  pause 0.5
  send skin
  pause 2
  return

loot:
  pause 0.5
  put loot
  pause 0.5
  gosub loot_gems
  gosub loot_boxes
  return

loot_gems:
  matchre loot_gems You pick up
  matchre RETURN I could not find|What were you referring|Stow what
  put stow gem
  matchwait 3
  goto loot_gems

loot_boxes:
  if matchre("$roomobjs", "(coffer|trunk|chest|strongbox|skippet|caddy|crate|casket|coffin|\bbox\b)") then {
    pause 0.5
    put stow box
  }
  return

check_loot:
  if matchre("$roomobjs", "(%skinnablecritters) ((which|that) appears dead|\(dead\))") then gosub skin
  if matchre("$roomobjs", "((which|that) appears dead|\(dead\))") then gosub loot
  goto target 

check_mana:
  if $mana <= 25 {
    echo  *** Recovering mana ***
    pause 0.5
    send bob
    pause 5
    goto check_mana
  }
  return

health:
  if $health <= 70 {
    goto abort
  }
  return

abort:
  var abort_count 0

  abort.loop:

    if %abort_count >= 3 {
      goto aborted
    }

    math abort_count add 1
    put #beep
    echo
    echo  *** Seek medical attention!  $health/100  ***
    echo
    put retreat
    pause 0.5
    put retreat
    pause 3
    goto abort.loop

aborted:
  pause 0.5
  put #goto $destination
  exit 

RETURN:
  return

end:
  put release cyclic
  pause 0.5
  put pathway stop
  pause 0.5
  echo *** Targeted Magic Mind Locked! ***
  put #parse HUNT DONE
