#[Magic]: Cast spell at full preparedness

matchre cast You feel fully prepared|formation of a targeting pattern|Your target pattern
matchwait 60
goto end

cast:
  match end You gesture
  match recast ...wait
  put cast %1 %2
  matchwait

recast:
  pause 0.5
  goto cast

end:
