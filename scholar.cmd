compstart:
  put get my textbook
  pause 1
  put open my textbook
  goto study

study:
  pause 0.1
  put study my textbook
  match study ...wait
  match page You begin
  match page You continue
  match page moment of clarity
  match end Why do you need
  matchwait

page:
  pause 0.1
  put turn my textbook
  match study You turn to
  match page ...wait
  matchwait

end:
  put stow my textbook
  pause 1
  put #parse ARCANA DONE
  put #flash
  exit
