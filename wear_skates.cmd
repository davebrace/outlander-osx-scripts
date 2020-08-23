put #script pause automapper

get_skates:
  pause 0.2
  match wear_stakes You get some
  match get_skates ...wait
  put get skates
  matchwait

wear_stakes:
  pause 0.2
  match end You slide your ice skates
  match wear_stakes ...wait
  put wear skates
  matchwait

end:
  put #script resume automapper
