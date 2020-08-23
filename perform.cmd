play:
  gosub clear

  if $Performance.LearningRate > 33 {
    goto end
  }

  matchre play ...wait
  matchre finish You struggle to begin|You're already playing|You fumble slightly as you begin|You begin a|You begin some

  put play ballad cheerful
  matchwait

finish:
  pause 1
  waitfor You finish playing
  goto play

end:
  echo ** Performance mind locked. **
  exit
