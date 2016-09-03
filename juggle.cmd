var item %1

start: 
  put get %item from $primary.container
  goto juggle

juggle:
  gosub check_exp
  put juggle %item
  pause 12
  goto juggle

check_exp:
  if $Perception.LearningRate >= 34 then goto finish
  return
  
finish:
  put put %item in $primary.container
  pause 1
  put #parse PERCEPTION DONE
  put #flash
