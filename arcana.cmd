# debuglevel 5 

start:
  put get mallet
  pause 0.5
  goto train

train:
  gosub clear
  gosub exp_check

  gosub cast_spell etf 15 29 fire

  gosub cast_spell sw 5 69
  gosub cast_spell suf 5 69

  gosub cast_spell es 2 60
  gosub cast_spell ignite 5 47 mallet

  goto train

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

  gosub charge
  gosub invoke

  match cast You feel fully prepared to cast your spell
  matchwait 35
  return


exp_check:
  if $Arcana.LearningRate >= 34 then goto move_out
  return

charge:
  pause 0.25
  matchre return You harness
  matchre charge ...wait
  put charge my cub %charge_mana
  matchwait 6
  return

invoke:
  pause 0.25
  matchre invoke but fail|accidentally attune yourself|...wait
  matchre return readying all of its mana|you only are able to attune yourself|manage to attune yourself exactly as you intended to|
  put invoke my cub %charge_mana
  matchwait 30
  return

cast:
  send cast %spell_target
  pause 0.5
  return

done:
  return

move_out:
  pause 2
  put #parse ARCANA DONE
  put #flash
