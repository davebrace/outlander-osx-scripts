# debuglevel 5

var skinnablecritters rat|hog|goblin|boar|eel|bobcat|cougar|reaver|wolf|snowbeast|gargoyle|togball|ape|tusky|wyvern|firecat|troll|crocodile|bear|bobcat|sow|silverfish|ogre

start:
  goto analyze

analyze:
  gosub clear
  gosub check_exp

  matchre fail You fail to find
  matchre analyze ...wait
  matchre nothing_to_analyze Analyze what
  matchre set_maneuver by landing a (attack|thrust|lunge|slice|chop|sweep|feint|jab|draw|slam|pummel|bash|parry|dodge|block|weave|circle|bob|grapple|tackle|shove|punch|claw|gouge|kick|elbow|slap|bite|butt|swing|knee)
  matchre set_maneuver by landing an (attack|thrust|lunge|slice|chop|sweep|feint|jab|draw|slam|pummel|bash|parry|dodge|block|weave|circle|bob|grapple|tackle|shove|punch|claw|gouge|kick|elbow|slap|bite|butt|swing|knee)
  pause 0.5
  put analyze
  matchwait 2

set_maneuver:
  var maneuver $1
  goto attack

fail:
  pause 1
  goto analyze

attack:
  gosub check_loot

  pause 0.5
  matchre attack ...wait
  matchre analyze Roundtime
  matchre advance You must be closer
  put %maneuver
  matchwait 2

advance:
  pause 1
  put advance
  goto analyze

nothing_to_analyze:
  matchre attack You turn
  matchre no_critter Attack what
  put attack
  matchwait 2

no_critter:
  echo *** no critters to analyze ***
  pause 15
  goto analyze 

check_loot:
  if matchre("$roomobjs", "(%skinnablecritters) ((which|that) appears dead|\(dead\))") then gosub skin
  if matchre("$roomobjs", "((which|that) appears dead|\(dead\))") then {
    put loot
    gosub handle_loot
    gosub check_exp
  }
  return

skin:
  if ($Skinning.LearningRate < 33) {
    gosub do_arrange
  }
  put skin
  pause 2
  return

handle_loot:
  pause 1
  gosub loot_coins
  gosub loot_gems
  gosub loot_boxes
  return

do_arrange:
  var count 0
  arrange.loop:
    if %count < $arrange {
      put arrange
      pause 2
      math count add 1
      goto arrange.loop
    }
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
    goto loot_boxes
  }
  return

check_exp:
  if ($Tactics.LearningRate > 33) then {
    goto finish
  }
  return
  
finish:
  put #flash
  echo *** Tactics Mind Locked ***
  put #parse TACTICS COMPLET2
  exit
