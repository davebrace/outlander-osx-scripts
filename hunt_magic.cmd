var arrange 0
var cast_count 0

var skinnablecritters rat|hog|goblin|boar|eel|bobcat|cougar|reaver|wolf|snowbeast|gargoyle|togball|ape|tusky|wyvern|firecat|troll|crocodile|bear

start:
  put .swap_greaves
  waitforre GREAVES SWAPPED

  put wield broadsword
  pause 1

  put rem armband
  pause 1

  put stance set 70 61 50 100
  pause 1

  goto debuff

debuff:
   put pathway stop
   pause 1

  gosub check_exp
  gosub clear
  var cast_count 0

   gosub cast_spell prep tremor 10 5

   pause 0.5

   gosub cast_spell prep thunderclap 10 3

  pause 0.5
  put pathway focus damage

  goto target

target:
  gosub check_exp
  gosub clear

  if %cast_count > 10 then goto debuff

  matchre wait_for_mobs There is nothing|close enough to attack|What are you trying to attack|It would help if you were closer

  gosub cast_spell targ fb 15 7

  gosub check_loot

cast:
  put cast
  pause 0.75
  wait
  math cast_count add 1
  return

cast_spell:
  gosub set_spell_action $1
  gosub set_spell $2
  gosub set_prep_mana $3
  gosub set_charge_mana $4

  gosub mana_check

  pause 0.5
  put %spell_action %spell_name %prep_mana

  gosub use_cambrinth

  matchre cast You feel fully prepared|formation of a targeting pattern|target pattern has finished forming
  matchwait 15
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
  put charge armband %charge_mana
  pause 3 
  gosub invoke_cambrinth
  return

invoke_cambrinth:
  matchre invoke_arm but fail|accidentally attune yourself
  matchre done readying all of its mana|you only are able to attune yourself|manage to attune yourself exactly as you intended to
  put invoke my armband %charge_mana
  matchwait 2
  return

done:
  return

check_exp:
  if $Targeted_Magic.LearningRate >= 34 {
    goto end
  }
  return

skin:
  pause 0.5
  put wear armband
  pause 0.5
  gosub do_arrange
  pause 0.5
  send skin
  pause 2
  return

do_arrange:
  var count 0
  arrange.loop:
    if %count < %arrange {
      put arrange
      pause 2
      math count add 1
      goto arrange.loop
    }
  return

handle_loot:
  pause 1
  put wear armband
  pause 1
  gosub loot_coins
  gosub loot_gems
  gosub loot_boxes
  pause 1
  put remove armband
  return

loot_coins:
  matchre loot_coins You pick up
  matchre RETURN I could not find|What were you referring
  send get coin
  matchwait 3
  goto loot_coins

loot_gems:
  matchre loot_gems You pick up
  matchre RETURN I could not find|What were you referring|Stow what
  send stow gem
  matchwait 3
  goto loot_gems

loot_boxes:
  if matchre("$roomobjs", "(coffer|trunk|chest|strongbox|skippet|caddy|crate|casket|coffin|\bbox\b)") then {
    pause 0.5
    put stow box
  }
  return

mana_check:
  if $mana <= 20 {
    echo  *** Recovering mana ***
    pause 0.5
    send bob
    pause 5
    goto mana_check
  }
  return

check_loot:
  gosub health
  if matchre("$roomobjs", "(%skinnablecritters) ((which|that) appears dead|\(dead\))") then gosub skin
  if matchre("$roomobjs", "((which|that) appears dead|\(dead\))") then {
    send loot
    gosub handle_loot
    gosub check_exp
  }

  gosub check_mana
  goto target

check_mana:
  if $mana <= 20 {
    echo
    echo  *** Recovering mana ***
    echo
    pause 0.5
    send bob
    pause 5
    goto check_mana
  }
  return

wait_for_mobs:
  put release
  pause 1
  gosub clear
  pause 5
  goto target

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
    send retreat
    send retreat
    pause 3
    goto abort.loop

RETURN:
  return

end:
  put sheath broad in bald
  pause 0.5
  put pathway stop
  pause 0.5
  put wear armband
  pause 0.5
  put #goto crossing
  waitforre ^YOU HAVE ARRIVED
  put #flash
  echo *** Targeted Magic Mind Locked! ***
