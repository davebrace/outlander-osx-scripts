fb:
  gosub clear

  if "$preparedspell" != "None" then {
    pause 35
    goto fb
  }

  if $mana <= 90 then {
    pause 10
    goto fb
  }

  goto prep_fb

prep_fb:
  pause 0.5
  match no_creature You are not engaged to anything, so you must specify a target to focus on
  match target_wait You begin to weave mana lines into a target pattern around 
  match fb You are already
  matchre prep_fb ...wait|Sorry, you may only type ahead
  put targ fb 63
  matchwait
  return

no_creature:
  pause 2
  match fb You let your concentration lapse and feel the spell's energies dissipate
  matchre no_creature ...wait|Sorry, you may only type ahead
  put release spell
  matchwait
  return

target:
  match no_creature You are not engaged to anything, so you must specify a target to focus on
  match target_wait You begin to weave mana lines into a target pattern around
  put targ
  matchwait
  return

target_wait:
  waitfor formation of a targeting pattern
  goto cast

cast:
  pause 0.25
  match fb ball of flame
  match target Your target pattern dissipates because 
  matchre fb backfires|are too mentally fatigued to finish the pattern
  matchre cast ...wait|Sorry, you may only type ahead 1 command
  put cast
  matchwait
  return
