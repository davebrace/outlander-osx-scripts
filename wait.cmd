start:
  gosub clear
  pause 0.5
  matchre wait_for_destination I could not find what you were referring to|What were you referring to|You'll need to wait|What dock|blocking your exit|you'll have to wait|You will be able to board soon|turn around just to let you off|There is no ferry here|You can't do that right now|so you're stuck here until the next one arrives|docks are not within reach|You can't go there|you can board as soon as they dock|There is no wooden gondola here|You will have to wait till it arrives
  match start ...wait
  put %0
  matchwait 3
  goto done

wait_for_destination:
  pause 10
  goto start

done: 
  put #flash
  put #beep
