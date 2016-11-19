# Simple script to max attunement
# debuglevel 5

start:
  goto summon

summon:
  gosub clear
  matchre summon gather a bigger charge
  matchre move_out so heavily embody|reached your limit
  put summon admittance 
  matchwait 30
  goto summon

move_out:
  put stand
  pause 1
  put #flash
  put #parse SUMMONING DONE
