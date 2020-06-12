var weapon knuckles
var sheath_style sheath

goto end

sheath_weapon:
  if %is_ranged = YES then gosub ranged_unload

  pause 0.5

  matchre wear_weapon where\?
  matchre return ^You sheath|^You sling|^You attach|^You strap|^With a flick of your wrist|^You hang|you sheath|^Sheathe what\?|^You easily strap|^With fluid and stealthy movements|^You slip|^You secure|^Sheathing
  send %sheath_style my %weapon
  matchwait

wear_weapon:
  pause 0.5
  matchre stow_weapon You can't wear that!|can't wear any more items like that
  matchre return You sling|Wear what?|You attach|You are already wearing
  put wear my %weapon
  matchwait

stow_weapon:
  pause 0.5
  matchre return You put|easily strap|already in your inventory|is too long|Where are you trying to put
  put stow my %weapon
  matchwait

end:
  gosub sheath_weapon

  if $righthand != Empty then send stow right
  if $lefthand != Empty then send stow left

  put look

  put #beep
  put #parse HUNT DONE
