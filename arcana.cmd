# debuglevel 5 

start:
  put get broad
  pause 0.5
  put swap
  pause 0.5
  put rem armband
  pause 0.5
  goto use_armband

use_armband:
  gosub clear
  gosub exp_check

  gosub cast_spell sw 5 17
  # gosub cast_spell suf 5 16
  # gosub cast_spell substr 5 16
  # gosub cast_spell tw 5 16

  gosub cast_spell es 1 9 
  gosub cast_spell ignite 5 12 broad

  goto use_armband

set_spell:
  var spell_name $1
  return

set_prep_mana:
  var prep_mana $1
  return

set_charge_mana:
  var charge_mana $1
  return

set_spell_target:
  var spell_target $1
  return

cast_spell:
  gosub set_spell $1
  gosub set_prep_mana $2
  gosub set_charge_mana $3
  gosub set_spell_target $4

  put prep %spell_name %prep_mana

  gosub charge_arm %charge_mana

  match cast You feel fully prepared to cast your spell
  matchwait 30 
  return

exp_check:
  if $Arcana.LearningRate >= 34 then goto move_out
  return

charge_arm:
  put charge armband %charge_mana
  pause 0.5
  wait
  gosub invoke_arm
  return

invoke_arm:
  matchre invoke_arm but fail|accidentally attune yourself
  matchre done readying all of its mana|you only are able to attune yourself|manage to attune yourself exactly as you intended to
  pause 0.5
  put invoke my armband %charge_mana
  matchwait 30
  return

cast:
  put cast %spell_target
  pause 0.5
  wait
  return

done:
  return

move_out:
  put wear armband
  put sheath broad in baldric
  pause 2
  put #parse ARCANA DONE
  put #flash
