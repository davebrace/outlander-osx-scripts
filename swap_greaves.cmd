var armor light greaves

start:
  gosub rem_greaves
  gosub stow_greaves

  var armor light greaves

  if ($Light_Armor.Ranks <= $Brigandine.Ranks && $Light_Armor.Ranks <= $Plate_Armor.Ranks) then {
    if ($Light_Armor.LearningRate < 30) then {
      echo *** Thick ***
      var armor thick greaves
    }
  }

  if ($Brigandine.Ranks <= $Plate_Armor.Ranks && $Brigandine.Ranks <= $Light_Armor.Ranks) then {
    if ($Brigandine.LearningRate < 30) then {
      echo *** Scale ***
      var armor scale greaves
    }
  }

  if ($Brigandine.LearningRate > 29 && $Plate_Armor.LearningRate > 29) then {
    echo *** Thick ***
    var armor thick greaves
  }
  if ($Plate_Armor.LearningRate > 29 && $Light_Armor.LearningRate > 29) then {
    echo *** Scale ***
    var armor scale greaves
  }
  if ($Brigandine.LearningRate > 29 && $Light_Armor.LearningRate > 29) then {
    echo *** Light ***
    var armor light greaves
  }
  
  gosub get_greaves
  
  gosub wear_armor

  put #parse GREAVES SWAPPED

  exit

rem_greaves:
  pause 0.2
  matchre return You remove some|Remove what?
  match rem_greaves ...wait
  put remove greaves
  matchwait 3
  gosub rem_greaves
  return

stow_greaves:
  pause 0.2
  matchre return You put your greaves|Stow what?
  match stow_greaves ...wait
  put stow greaves
  matchwait 3
  gosub stow_greaves
  return

get_greaves:
  pause 0.2
  match return You get some
  match get_greaves ...wait
  put get %armor
  matchwait 3
  gosub get_greaves
  return

wear_armor:
  pause 0.2
  match return You attach some
  match wear_armor ...wait
  match stow You can't fit
  put wear %armor
  matchwait 3 
  gosub wear_armor
  return
