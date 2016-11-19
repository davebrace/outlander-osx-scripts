#ingot_making Smelt or refine

if_1 goto %1

ECHO ******************************
ECHO **
ECHO ** Before you start this script you should have all metals in the crucible, 
ECHO ** and your hands empty
ECHO **
ECHO ** To use type .ingot_making smelt <toolcontainer> <Ingotcontainer>
ECHO **        or   .ingot_making refine <toolcontainer> <Ingotcontainer>
ECHO **
ECHO ******************************
exit

Smelt:
  put glance
  match Smelt1 You glance down at your empty hands
  match ingotend You glance down to see
matchwait

Smelt1:
  pause
  put get rod from my %2

Stir:
  pause 1
  put stir cruc with my rod
  match Stir ...wait
  match Turn accumulating along the crucible's sides.
  match Bellows unable to consume its fuel.
  match Bellows As you finish working the fire dims and produces less heat from the stifled coals
  match Done1 You can only mix a crucible if it has something inside of it.
  match Done1 You should probably remove the non-metal items
  match Done At last the metal appears to be thoroughly mixed and you pour it into an ingot mold
  match Shovel fire dies down and needs more fuel.
  match Stir Roundtime
matchwait 

Turn:
  pause 1
  put turn crucible
  match Turn ...wait
  match Stir Roundtime
matchwait

Bellows:
  pause
  save "bellows"
  pause 2
  put get bellows from my %2
  pause
  put push bellows
  match Stow Roundtime
matchwait

Shovel:
  pause
  save "shovel"
  pause 2
  put get shovel from my %2
  pause
  put push fuel with my shovel
  match Stow Roundtime
matchwait

Stow:
  pause 1
  put put my %s in my %2
goto Stir

Done:
  pause
  put put my rod in my %2
  pause
  put put my ingot in my %3
  pause
  echo **
  echo ** You have completed the ingot
  echo **
exit

Done1:
  pause
  put put my rod in my %2
  pause
  echo **
  echo ** Either you have non-metal items or nothing in the crucible
  echo **
exit

refine:
  put glance
  match Refine1 You glance down at your empty hands
  match ingotend You glance down to see
matchwait

refine1:
  pause
  put get rod from my %2
  pause
  put get flux from my %2
  waitfor You get
  put pour my flux in cruci
  match Stir2 Roundtime
  match Turn2 accumulating along the crucible's sides.
  match Bellows2 unable to consume its fuel.
  match Shovel2 fire dies down and needs more fuel.
matchwait 

Stir2:
  pause 1
  put put my flux in my %2
goto Stir

Turn2:
  pause 1
  put put my flux in my %2
goto Turn

Bellows2:
  pause 1
  put put my flux in my %2
goto Bellows

Shovel2:
  pause 1
  put put my flux in my %2
goto Shovel

INGOTEND:
  pause 2
  echo ********************************************************************
  echo * YOU HAVE SOMETHING IN HAND!  PUT IT AWAY AND RESTART THE SCRIPT! *
  echo ********************************************************************
exit
