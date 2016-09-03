start:
  put rem greaves
  pause 3
  put put greaves in pack
  pause 0.5

  var armor light greaves
  
  if ($Light_Armor.Ranks < $Brigandine.Ranks && $Light_Armor.Ranks < $Light_Plate.Ranks && $Light_Armor.LearningRate < 30) {
    var armor rugged greaves
  }
  if ($Brigandine.Ranks < $Plate_Armor.Ranks && $Brigandine.LearningRate < 30) {
    var armor scale greaves
  }
  if ($Plate_Armor.LearningRate > 29) {
    var armor scale greaves  
  }
  if ($Brigandine.LearningRate > 29 && $Plate_Armor.LearningRate > 29) {
    var armor rugged greaves
  }
  if ($Plate_Armor.LearningRate > 29 && $Light_Armor.LearningRate > 29) {
    var armor scale greaves
  }
  if ($Brigandine.LearningRate > 29 && $Light_Armor.LearningRate > 29) {
    var armor light greaves
  }
  
  put get %armor
  pause 0.5
  
  put wear %armor
  pause 3

  put #parse GREAVES SWAPPED
