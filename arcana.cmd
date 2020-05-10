# debuglevel 5 

start:
  put get broad
  pause 0.5
  put rem armband
  pause 0.5
  goto use_armband

use_armband:
  gosub clear
  gosub exp_check

  gosub cast_spell sw 10 24
  gosub cast_spell suf 10 24
  # gosub cast_spell substr 5 16
  # gosub cast_spell tw 5 16

  gosub cast_spell es 10 24
  gosub cast_spell ignite 5 23 broad

  goto use_armband

mana_check:
  if $mana <= 40 {
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

  gosub charge_arm %charge_mana

  match cast You feel fully prepared to cast your spell
  matchwait 35
  return

exp_check:
  if $Arcana.LearningRate >= 34 then goto move_out
  return

charge_arm:
  put charge armband $1
  pause 0.5
  gosub invoke_arm
  return

invoke_arm:
  matchre invoke_arm but fail|accidentally attune yourself
  matchre return readying all of its mana|you only are able to attune yourself|manage to attune yourself exactly as you intended to|
  pause 0.5
  put invoke my armband %charge_mana
  matchwait 30
  return

cast:
  put cast %spell_target
  pause 0.5
  return

done:
  return

move_out:
  put wear armband
  put sheath broad in baldric
  pause 2
  put #parse ARCANA DONE
  put #flash
