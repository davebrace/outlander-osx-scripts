# debuglevel 5 

start:
  put get mallet
  pause 0.5
  goto use_armband

use_armband:
  gosub clear
  gosub exp_check

  gosub cast_spell etf 15 22 fire

  gosub cast_spell sw 5 48
  gosub cast_spell suf 5 48

  gosub cast_spell es 1 48
  gosub cast_spell ignite 5 43 mallet

  goto use_armband

mana_check:
  if $mana <= 30 {
    echo  *** Recovering mana ***
    pause 5
    goto mana_check
  }
  return

cast_spell:
  var spell_name $1
  var prep_mana $2
  var charge_mana $3
  var spell_target $4

  gosub mana_check

  put prep %spell_name %prep_mana
  pause 0.5

  gosub charge_arm 
  gosub invoke_arm

  match cast You feel fully prepared to cast your spell
  matchwait 35
  return


exp_check:
  if $Arcana.LearningRate >= 34 then goto move_out
  return

charge_arm:
  pause 0.25
  matchre return You harness
  matchre charge_arm ...wait
  put charge armband %charge_mana
  matchwait 6
  return

invoke_arm:
  pause 0.25
  matchre invoke_arm but fail|accidentally attune yourself|...wait
  matchre return readying all of its mana|you only are able to attune yourself|manage to attune yourself exactly as you intended to|
  put invoke my armband %charge_mana
  matchwait 30
  return

cast:
  send cast %spell_target
  pause 0.5
  return

done:
  return

move_out:
  put stow mallet
  pause 2
  put #parse ARCANA DONE
  put #flash
