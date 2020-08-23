put #script pause automapper

remove_skates:
  pause 0.2
  match stow_stakes You untie your skates
  match remove_skates ...wait
  put remove skates
  matchwait

stow_stakes:
  pause 0.2
  match end You put your skates
  match stow_stakes ...wait
  put stow skates
  matchwait

end:
  put #script resume automapper
