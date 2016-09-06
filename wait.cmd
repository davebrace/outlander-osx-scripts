var destination %1

start:
  matchre wait_for_destination I could find what you were referring to|What were you referring to|You'll need to wait|What dock
  put go %destination
  matchwait 10
  goto done

wait_for_destination:
  pause 15
  goto start

done: 
