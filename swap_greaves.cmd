start:
  put rem greaves
  pause 3
  put stow greaves
  pause 0.5

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
  
  put get %armor
  pause 0.5
  
  put wear %armor
  pause 3

  put #parse GREAVES SWAPPED
