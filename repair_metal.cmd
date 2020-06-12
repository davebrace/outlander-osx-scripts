debuglevel 2
var person %1

start:
  gosub repair_item vest
  gosub repair_item cap
  gosub repair_item tasset
  gosub repair_item vambraces
  gosub repair_item aventail

  var scale_greaves scale greaves
  gosub repair_item %scale_greaves

  var light_greaves light greaves
  gosub repair_item %light_greaves

  gosub repair_item gloves
  gosub repair_item shield
  gosub repair_item mask
  gosub repair_item stick
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
  matchre return You remove
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
  put stow $righthand
  goto rerieve_items

wear_item:
  matchre stow_righthand fit over the 
  matchre return You attach|You slip|You put|You work your way|You slide|You hang
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
