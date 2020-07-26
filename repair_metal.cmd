# debuglevel 2
var person %1

if_1 then goto start
else {
  echo  *** You need to provide the name of the repair person ***
  exit
}

start:
  gosub repair_item shield
  gosub repair_item stick
  gosub repair_item shirt
  gosub repair_item balaclava
  gosub repair_item gloves

  var scale_greaves scale greaves
  gosub repair_item %scale_greaves

  var light_greaves light greaves
  gosub repair_item %light_greaves

  pause 120
  goto retrieve_items

repair_item:
  var item $0
  gosub remove
  pause 0.5
  put give %item to %person
  pause 0.25
  put give %item to %person
  pause 0.5
  put stow ticket
  pause 0.5
  return

remove: 
  pause 0.5
  matchre return You remove|You loosen|You work your way|You take a|You pull off
  matchre get_item Remove what
  matchre remove ...wait
  put remove %item
  matchwait 2
  return

get_item:
  pause 0.5
  put get %item
  return

get_ticket:
  matchre end What were you
  matchre return You get
  put get ticket
  matchwait 2
  return

stow_righthand:
  pause 0.25
  put stow right
  goto retrieve_items

wear_item:
  matchre stow_righthand fit over the|You can't wear that!
  matchre return You attach|You slip|You put|You work your way|You slide|You hang|You strap
  put wear right
  matchwait 3
  return

retrieve_items:
  pause 0.5
  gosub get_ticket
  pause 0.5
  put give ticket to %person
  pause 0.5
  gosub wear_item
  goto retrieve_items

end:
  put #flash
  exit
