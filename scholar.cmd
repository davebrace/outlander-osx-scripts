compstart:
  put get my textbook
  pause 0.5
  put open my textbook
  pause 0.5
  goto study

study:
  gosub clear
  if $FirstAid.LearningRate > 33 then {
    goto end
  }
  pause 0.1
  match study ...wait
  match page You begin
  match page You continue
  match page moment of clarity
  match restart find it almost impossible to do
  match end Why do you need
  put study my textbook
  matchwait

restart:
  pause 0.1
  match study You turn to
  match restart ...wait
  put turn my textbook to grass eel
  matchwait

page:
  pause 0.1
  match study You turn to
  match page ...wait
  put turn my textbook
  matchwait

end:
  put stow my textbook
  pause 0.5
  echo *** First Aid mind locked! ***
  put #parse SCHOLARSHIP DONE
  put #flash
  exit
