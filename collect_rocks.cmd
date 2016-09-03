# debuglevel 5 

start:
  goto collect_rocks

collect_rocks:
  gosub exp_check
  put collect rock
  pause 1
  wait
  put kick rocks
  goto collect_rocks 

exp_check:
  if $Outdoorsmanship.LearningRate >= 34 then goto move_out
  return

move_out:
  pause 2
  put #parse OUTDOORSMANSHIP DONE
  put #flash
