var destination %1

start:
  matchre wait_for_destination I could find what you were referring to|What were you referring to|You'll need to wait|What dock|blocking your exit|you'll have to wait|You will be able to board soon|...wait|turn around just to let you off|There is no ferry here|You can't do that right now
  put go %destination
  matchwait 10
  goto done

wait_for_destination:
  pause 20
  goto start

done: 
