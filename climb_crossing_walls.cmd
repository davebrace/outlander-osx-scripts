# Climb Crossing Walls
# This Script originally created by Kraelyst
# Source: https://elanthipedia.play.net/Climb_Crossing_Walls_(script)

echo *** START OUTSIDE CROSSING BANK ***

put set roomname
put awake

CLIMB:
  pause
  move northwest
  move north
  move north
  move north
  move north
  move north
  move north
  move east
  move east
  move north
  move east
  move east
  move north
  move north
  move east
  move go stair
  move south

CLIMB-001:
  match PASS-001 [Outside East Wall, Footpath]
  match FAIL-001 You must be standing
  match FAIL-001 steepness is intimidating
  match FAIL-001 can't seem to find purchase
  match FAIL-001 find it hard going.
  match FAIL-001 your footing is questionable
  match FAIL-001 slip after a few feet
  match FAIL-001 A wave of dizziness hits you
  match FAIL-001 Struck by vertigo
  match CLIMB-001 ...wait
  put climb break
  matchwait

PASS-001:
  match PASS-001 ...wait
  match PASS-001x [
  move north
  matchwait

PASS-001x:
  move go gate
  move west
  move go stair
  move south
  goto CLIMB-002

FAIL-001:
  pause
  goto CLIMB-002

CLIMB-002:
  match PASS-002 [Northeast Wilds, Outside Northeast Gate]
  match FAIL-002 You must be standing
  match FAIL-002 steepness is intimidating
  match FAIL-002 can't seem to find purchase
  match FAIL-002 find it hard going.
  match FAIL-002 your footing is questionable
  match FAIL-002 slip after a few feet
  match FAIL-002 A wave of dizziness hits you
  match FAIL-002 Struck by vertigo
  match CLIMB-002 ...wait
  put climb embrasure
  matchwait

FAIL-002:
  match FAIL-002 ...wait
  match FAIL-002x [
  put n
  matchwait

FAIL-002x:
  pause 1
  move go stair
  move e
  move go gate

PASS-002:
  match PAss-002 ...wait
  match PASS-002x [
  put go footpath
  matchwait

PASS-002x:
  goto CLIMB-01

CLIMB-01:
  SAVE FAIL-01
  match PASS-01 [Crossing, East Wall Battlements]
  match FAIL-01 You must be standing
  match FAIL-01 steepness is intimidating
  match FAIL-01 can't seem to find purchase
  match FAIL-01 find it hard going.
  match FAIL-01 your footing is questionable
  match FALLEN slip after a few feet
  match FAIL-01 A wave of dizziness hits you
  match FAIL-01 Struck by vertigo
  match CLIMB-01 ...wait
  put climb wall
  matchwait

PASS-01:
  match PASS-01 ...wait
  match PASS-01x [
  put n
  matchwait

PASS-01x:
  move go stair
  move e
  move go gate
  move go footpath
  pause 0.25
  goto FAIL-01

FAIL-01:
  pause 0.25
  match FAIL-01 ...wait
  match FAIL-01x [
  put s
  matchwait

FAIL-01x:
  move down
  pause 0.25
  move s
  pause 0.25
  move s
  pause 0.25
  move sw
  goto CLIMB-02

CLIMB-02:
  SAVE FAIL-02
  match PASS-02 [Crossing, East Wall Battlements]
  match FAIL-02 You must be standing
  match FAIL-02 steepness is intimidating
  match FAIL-02 can't seem to find purchase
  match FAIL-02 find it hard going.
  match FAIL-02 your footing is questionable
  match FALLEN slip after a few feet
  match FAIL-02 A wave of dizziness hits you
  match FAIL-02 Struck by vertigo
  match CLIMB-02 ...wait
  put climb wall
  matchwait

PASS-02:
  match PASS-02 ...wait
  match PASS-02x [
  put s
  matchwait

PASS-02x:
  move go stair
  move go gate
  move go bush
  move n
  goto CLIMB-03

FAIL-02:
  match FAIL-02 ...wait
  match FAIL-02x [
  put s
  matchwait

FAIL-02x:
  goto CLIMB-03

CLIMB-03:
  SAVE FAIL-03
  match PASS-03 [Crossing, East Wall Battlements]
  match FAIL-03 You must be standing
  match FAIL-03 steepness is intimidating
  match FAIL-03 can't seem to find purchase
  match FAIL-03 find it hard going.
  match FAIL-03 your footing is questionable
  match FALLEN slip after a few feet
  match FAIL-03 A wave of dizziness hits you
  match FAIL-03 Struck by vertigo
  match CLIMB-03 ...wait
  put climb wall
  matchwait

PASS-03:
  match PASS-03 ...wait
  match PASS-03x [
  put s
  matchwait

PASS-03x:
  move go stair
  move go gate
  goto CLIMB-04

FAIL-03:
  match FAIL-03 ...wait
  match FAIL-03x [
  put s
  matchwait

FAIL-03x:
  goto CLIMB-04

CLIMB-04:
  SAVE FAIL-04
  match PASS-03 [Crossing, East Wall Battlements]
  match PASS-04 [Crossing, East Gate Battlements]
  match FAIL-04 You must be standing
  match FAIL-04 steepness is intimidating
  match FAIL-04 can't seem to find purchase
  match FAIL-04 find it hard going.
  match FAIL-04 your footing is questionable
  match FALLEN slip after a few feet
  match FAIL-04 A wave of dizziness hits you
  match FAIL-04 Struck by vertigo
  match RETREAT closes to pole weapon range on you
  match CLIMB-04 ...wait
  put climb wall
  matchwait

PASS-04:
  pause
  goto CLIMB-05

RETREAT:
  pause
  match RETREAT ...wait
  match RETREAT Roundtime
  match RETREAT back to pole range.
  match FAIL-04 retreat from combat.
  match FAIL-04 You are already as far away as you can get!
  put retreat
  matchwait

FAIL-04:
  pause
  put SoUTH
  match FAil-04 ...wait
  match FAIL-04x [
  put go gate
  matchwait

FAIL-04x:
  move go stair
  goto CLIMB-05

CLIMB-05:
  SAVE FAIL-05
  match PASS-05 [Eastern Tier, Outside Gate]
  match FAIL-05 You must be standing
  match FAIL-05 steepness is intimidating
  match FAIL-05 can't seem to find purchase
  match FAIL-05 find it hard going.
  match FAIL-05 your footing is questionable
  match FALLEN slip after a few feet
  match FAIL-05 A wave of dizziness hits you
  match FAIL-05 Struck by vertigo
  match CLIMB-05 ...wait
  put climb embrasure
  matchwait

PASS-05:
  match PAss-05 ...wait
  match PASS-05x [
  put go gate
  matchwait

PASS-05x:
  move go stair

FAIL-05:
  match FAIL-05 ...wait
  match FAIL-05x [
  put n
  matchwait

FAIL-05x:
  goto CLIMB-06

CLIMB-06:
  SAVE FAIL-06
  match PASS-06 [Outside East Wall, Footpath]
  match FAIL-06 You must be standing
  match FAIL-06 steepness is intimidating
  match FAIL-06 can't seem to find purchase
  match FAIL-06 find it hard going.
  match FAIL-06 your footing is questionable
  match FALLEN slip after a few feet
  match FAIL-06 A wave of dizziness hits you
  match FAIL-06 Struck by vertigo
  match CLIMB-06 ...wait
  put climb break
  matchwait

PASS-06:
  match PASS-06 ...wait
  match PASS-06x [
  put s
  matchwait

PASS-06x:
  move go gate
  move go stair
  move n
  goto CLIMB-07

FAIL-06:
  pause
  goto CLIMB-07

CLIMB-07:
  SAVE FAIL-07
  match PASS-07 [Outside East Wall, Footpath]
  match FAIL-07 You must be standing
  match FAIL-07 steepness is intimidating
  match FAIL-07 can't seem to find purchase
  match FAIL-07 find it hard going.
  match FAIL-07 your footing is questionable
  match FALLEN slip after a few feet
  match FAIL-07 A wave of dizziness hits you
  match FAIL-07 Struck by vertigo
  match CLIMB-07 ...wait
  put climb embrasure
  matchwait

PASS-07:
  match PASS-07 ...wait
  match PASS-07x [
  put s
  matchwait

PASS-07x:
  move s
  move go gate
  goto TRAVEL-08

FAIL-07:
  match FAIL-07 ...wait
  match FAIL-07x [
  put s
  matchwait

FAIL-07x:
  move go stair
  goto TRAVEL-08

TRAVEL-08:
  move w
  move w
  move w
  move w
  move nw
  move n
  move n
  move n
  move n
  move n
  move n
  move w
  move w
  move w
  move w
  move go bridge
  move w
  move w
  move w
  move w
  move go stair
  move s

CLIMB-08:
  SAVE FAIL-08
  match PASS-08 [Mycthengelde, Flatlands]
  match FAIL-08 You must be standing
  match FAIL-08 steepness is intimidating
  match FAIL-08 can't seem to find purchase
  match FAIL-08 find it hard going.
  match FAIL-08 your footing is questionable
  match FALLEN slip after a few feet
  match FAIL-08 A wave of dizziness hits you
  match FAIL-08 Struck by vertigo
  match CLIMB-08 ...wait
  put climb embrasure
  matchwait

PASS-08:
  pause
  goto CLIMB-09

FAIL-08:
  match FAIL-08 ...wait
  match FAIL-08x [
  put n
  matchwait

FAIL-08x:
  pause 1
  move go stair
  move go gate
  move nw
  goto CLIMB-09

CLIMB-09:
  SAVE FAIL-09
  match PASS-09 [Crossing, West Wall Battlements]
  match FAIL-09 You must be standing
  match FAIL-09 steepness is intimidating
  match FAIL-09 can't seem to find purchase
  match FAIL-09 find it hard going.
  match FAIL-09 your footing is questionable
  match FALLEN slip after a few feet
  match FAIL-09 A wave of dizziness hits you
  match FAIL-09 Struck by vertigo
  match CLIMB-09 ...wait
  put climb wall
  matchwait

PASS-09:
  match PASS-09 ...wait
  match PASS-09x [
  put n
  matchwait

PASS-09x:
  goto CLIMB-10

FAIL-09:
  match FAIL-09 ...wait
  match FAIL-09x [
  put se
  matchwait

FAIL-09x:
  move go gate
  move go stair
  goto CLIMB-10

CLIMB-10:
  SAVE FAIL-10
  match PASS-10 [Mycthengelde, Flatlands]
  match FAIL-10 You must be standing
  match FAIL-10 steepness is intimidating
  match FAIL-10 can't seem to find purchase
  match FAIL-10 find it hard going.
  match FAIL-10 your footing is questionable
  match FALLEN slip after a few feet
  match FAIL-10 A wave of dizziness hits you
  match FAIL-10 Struck by vertigo
  match CLIMB-10 ...wait
  put climb embrasure
  matchwait

PASS-10:
  match PASS-10 ...wait
  match PASS-10x [
  put go gate
  matchwait

PASS-10x:
  move go stair

FAIL-10:
  match FAIL-10 ...wait
  match FAIL-10x [
  put e
  matchwait

FAIL-10x:
  goto CLIMB-11

CLIMB-11:
  SAVE FAIL-11
  match PASS-11 [Northwall Trail, Wooded Grove]
  match FAIL-11 You must be standing
  match FAIL-11 steepness is intimidating
  match FAIL-11 can't seem to find purchase
  match FAIL-11 find it hard going.
  match FAIL-11 your footing is questionable
  match FALLEN slip after a few feet
  match FAIL-11 A wave of dizziness hits you
  match FAIL-11 Struck by vertigo
  match CLIMB-11 ...wait
  put climb break
  matchwait

PASS-11:
  match PASS-11 ...wait
  match PASS-11x [
  put s
  matchwait

PASS-11x:
  move go gate
  move go stair
  move e
  goto CLIMB-12

FAIL-11:
  pause
  goto CLIMB-12

CLIMB-12:
  SAVE FAIL-12
  match PASS-12 [Northwall Trail, Wooded Grove]
  match FAIL-12 You must be standing
  match FAIL-12 steepness is intimidating
  match FAIL-12 can't seem to find purchase
  match FAIL-12 find it hard going.
  match FAIL-12 your footing is questionable
  match FALLEN slip after a few feet
  match FAIL-12 A wave of dizziness hits you
  match FAIL-12 Struck by vertigo
  match CLIMB-12 ...wait
  put climb embrasure
  matchwait

PASS-12:
  pause
  goto CLIMB-13

FAIL-12:
  match FAIL-12 ...wait
  match FAIL-12x [
  put w
  matchwait

FAIL-12x:
  move go stair
  move go gate
  move go trail
  move ne
  goto CLIMB-13

CLIMB-13:
  SAVE FAIL-13
  match PASS-13 [Crossing, North Wall Battlements]
  match FAIL-13 You must be standing
  match FAIL-13 steepness is intimidating
  match FAIL-13 can't seem to find purchase
  match FAIL-13 find it hard going.
  match FAIL-13 your footing is questionable
  match FALLEN slip after a few feet
  match FAIL-13 A wave of dizziness hits you
  match FAIL-13 Struck by vertigo
  match CLIMB-13 ...wait
  put climb wall
  matchwait

PASS-13:
  match PASS-13 ...wait
  match PASS-13x [
  put w
  matchwait

PASS-13x:
  move go stair
  move go gate
  move go trail
  goto CLIMB-14

FAIL-13:
  match fAIL-13 ...wait
  match FAIL-13x [
  put sw
  matchwait

FAIL-13x:
  goto CLIMB-14

CLIMB-14:
  SAVE FAIL-14
  match PASS-14 [Crossing, North Wall Battlements]
  match FAIL-14 You must be standing
  match FAIL-14 steepness is intimidating
  match FAIL-14 can't seem to find purchase
  match FAIL-14 find it hard going.
  match FAIL-14 your footing is questionable
  match FALLEN slip after a few feet
  match FAIL-14 A wave of dizziness hits you
  match FAIL-14 Struck by vertigo
  match CLIMB-14 ...wait
  put climb wall
  matchwait

PASS-14:
  match PASS-14 ...wait
  match PASS-14x [
  put w
  matchwait

PASS-14x:
  move go stair
  move go gate
  goto CLIMB-15

FAIL-14:
  match FAIL-14 ...wait
  match FAIL-14x [
  put s
  matchwait

FAIL-14x:
  goto CLIMB-15

CLIMB-15:
  SAVE FAIL-15
  match PASS-15 [Crossing, West Gate Battlements]
  match FAIL-15 You must be standing
  match FAIL-15 steepness is intimidating
  match FAIL-15 can't seem to find purchase
  match FAIL-15 find it hard going.
  match FAIL-15 your footing is questionable
  match FALLEN slip after a few feet
  match FAIL-15 A wave of dizziness hits you
  match FAIL-15 Struck by vertigo
  match CLIMB-15 ...wait
  put climb wall
  matchwait

PASS-15:
  match PASS-15 ...wait
  match PASS-15x [
  put go stair
  matchwait

PASS-15x:
  goto TRAVEL-15

FAIL-15:
  match FAil-15 ...wait
  match FAIL-15x [
  put go gate
  matchwait

FAIL-15x:
  goto TRAVEL-15

TRAVEL-15:
  move e
  move e
  move e
  move e
  move e
  move e
  move e
  move e
  move e
  move s
  move s
  move s
  move s
  move s
  move s
  move se
  pause
  put sk ath
  match climb EXP HELP
  match quit mind lock
  match quit nearly locked
  match quit enthralled
  matchwait 

FALLEN:
  pause
  match STOOD You stand
  match STOOD You are already standing
  match FALLEN cannot manage to stand.
  match FALLEN The weight of all your possessions
  match FALLEN ...wait
  put stand
  matchwait

STOOD:
  goto %s

QUIT:
  put hide
  put #flash
  exit
