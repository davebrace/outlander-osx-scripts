#Climbing in Shard

ECHO
ECHO *** Start inside or outside any Shard gate (or on the East Gate Wall).
ECHO *** Script ends on eastern wall because hopefully thugs won't drag you to Undershard from there.
ECHO
put awake
pause
match OutWest Eerie chanting echoes over the bridge,
match InWest [Shard, West City Gates]
match InInSouth [Shard, South Square]
match OutOutSouth South Square on the city side
match InSouth stairway to the tower battlements
match OutSouth a spear stuck in the ground
match OutEast [Shard, East Bridge]
match InEast [Shard, East City Gates]
match InNorth [Shard, North City Gates]
match OutNorth [Shard, North Bridge]
match StartScript stone-paved walkway extends a short
match CLIMB01 High above the East Gate,
put look
matchwait

OutNorth:
move go gate
InNorth:
move e
move e
move se
move se
move se
move s
goto InEast

OutWest:
move go gate
InWest:
move s
move se
move se
move se
move e
move e
goto InInSouth

OutSouth:
move go gate
InSouth:
move n
move n
move n
move n
OutOutSouth:
move go South Square
goto InInSouth

InInSouth:
move e
move e
move ne
move ne
move ne
move n
goto InEast

OutEast:
move go gate
InEast:
move ClIMB ladder
StartScript:
move n

CLIMB01:
SAVE CLIMB01
match CLIMB02 [Shard, East Bridge]
match FALLEN slip after a few feet
match FALLEN You must be standing
match FAIL01 steepness is intimidating
match FAIL01 can't seem to find purchase
match FAIL01 find it hard going.
match FAIL01 your footing is questionable
match FAIL01 A wave of dizziness hits you
match FAIL01 Struck by vertigo
match retreat engaged
put climb embrasure
matchwait

FAIL01:
move s
move climb ladder
move go gate
goto CLIMB02

CLIMB02:
SAVE CLIMB02
match PASS02 [Shard, East Battlements]
match FALLEN slip after a few feet
match FALLEN You must be standing
match FAIL02 steepness is intimidating
match FAIL02 can't seem to find purchase
match FAIL02 find it hard going.
match FAIL02 your footing is questionable
match FAIL02 A wave of dizziness hits you
match FAIL02 Struck by vertigo
match retreat engaged
put climb city wall
matchwait

PASS02:
move s
move climb ladder
move go gate
goto FAIL02

FAIL02:
move go gate
move n
move nw
move nw
move nw
move w
move w
move climb ladder
move w
goto CLIMB03

CLIMB03:
SAVE CLIMB03
match CLIMB04 [Shard, North Bridge]
match FALLEN slip after a few feet
match FALLEN You must be standing
match FAIL03 steepness is intimidating
match FAIL03 can't seem to find purchase
match FAIL03 find it hard going.
match FAIL03 your footing is questionable
match FAIL03 A wave of dizziness hits you
match FAIL03 Struck by vertigo
match retreat engaged
put climb embrasure
matchwait

FAIL03:
move e
move climb ladder
move go gate
goto CLIMB04

CLIMB04:
SAVE CLIMB04
match PASS04 [Shard, North Battlements]
match FALLEN slip after a few feet
match FALLEN You must be standing
match FAIL04 steepness is intimidating
match FAIL04 can't seem to find purchase
match FAIL04 find it hard going.
match FAIL04 your footing is questionable
match FAIL04 A wave of dizziness hits you
match FAIL04 Struck by vertigo
match retreat engaged
put climb city wall
matchwait

PASS04:
move e
move climb ladder
move go gate
goto FAIL04

FAIL04:
move go gate
move w
move w
move sw
move sw
move sw
move s
move climb ladder
move s
goto CLIMB05

CLIMB05:
SAVE CLIMB05
match CLIMB06 [Shard, West Bridge]
match FALLEN slip after a few feet
match FALLEN You must be standing
match FAIL05 steepness is intimidating
match FAIL05 can't seem to find purchase
match FAIL05 find it hard going.
match FAIL05 your footing is questionable
match FAIL05 A wave of dizziness hits you
match FAIL05 Struck by vertigo
match retreat engaged
put climb embrasure
matchwait

FAIL05:
move n
move climb ladder
move go gate
goto CLIMB06

CLIMB06:
SAVE CLIMB06
match PASS06 [Shard, West Battlements]
match FALLEN slip after a few feet
match FALLEN You must be standing
match FAIL06 steepness is intimidating
match FAIL06 can't seem to find purchase
match FAIL06 find it hard going.
match FAIL06 your footing is questionable
match FAIL06 A wave of dizziness hits you
match FAIL06 Struck by vertigo
match retreat engaged
put climb city wall
matchwait

PASS06:
move n
move climb ladder
move go gate
goto FAIL06

FAIL06:
move go gate
move s
move se
move se
move se
move e
move e
move go bridge
move s
move s
move s
move s
move climb stairway
move e
goto CLIMB07

CLIMB07:
SAVE CLIMB07
match CLIMB08 [Old Ilithi Trade Route, Journey's Rest]
match FALLEN slip after a few feet
match FALLEN You must be standing
match FAIL07 steepness is intimidating
match FAIL07 can't seem to find purchase
match FAIL07 find it hard going.
match FAIL07 your footing is questionable
match FAIL07 A wave of dizziness hits you
match FAIL07 Struck by vertigo
match retreat engaged
put climb embra
matchwait

FAIL07:
move w
move climb stairway
move go gate
goto CLIMB08

CLIMB08:
SAVE CLIMB08
match PASS08 [The New Bridge, East Tower]
match FALLEN slip after a few feet
match FALLEN You must be standing
match FAIL08 steepness is intimidating
match FAIL08 can't seem to find purchase
match FAIL08 find it hard going.
match FAIL08 your footing is questionable
match FAIL08 A wave of dizziness hits you
match FAIL08 Struck by vertigo
match retreat engaged
put climb gatehouse wall
matchwait

PASS08:
move w
move climb stairway
move go gate
goto FAIL08

FAIL08:
move go gate
move n
move n
move n
move n
move go south square
move w
move w
move nw
move nw
move nw
move n

DECISION01:
pause
put exp 180
match GoNorthGate Climbing:
match GoWestGate EXP HELP for more information
matchwait

GoWestGate:
move go gate
move w
move w
move w
move w
move w
move nw
move n
move nw
move w
move n
move nw
move n
move nw
move nw
move n
move ne
move ne
move ne
move n
move ne
move n
move nw
move nw
move w
move nw
move w
move w
move sw
move nw
move w
move w
move w
move w
move w
move sw
move nw
move w
move w
move sw
move sw
move nw
move w
move w
move sw
move sw
move nw
move w
move sw
move w
move sw
move climb narrow path
move w
move nw
move w
move sw
move climb game trail
move nw
move s
move sw
move w
move nw
move w
move w
move w
move go narrow track
move nw
move sw
move s
move nw
move s
goto CLIMB09

CLIMB09:
SAVE CLIMB09
match CLIMB10 Angling sharply, the track dips
match FALLEN slip after a few feet
match FALLEN You must be standing
match FAIL09 steepness is intimidating
match FAIL09 can't seem to find purchase
match FAIL09 find it hard going.
match FAIL09 your footing is questionable
match FAIL09 A wave of dizziness hits you
match FAIL09 Struck by vertigo
match retreat engaged
put climb steep trail
matchwait

CLIMB10:
SAVE CLIMB10
match CLIMB11 [Tanis Belta Gaizen, Streambed]
match FALLEN slip after a few feet
match FALLEN You must be standing
match FAIL10 steepness is intimidating
match FAIL10 can't seem to find purchase
match FAIL10 find it hard going.
match FAIL10 your footing is questionable
match FAIL10 A wave of dizziness hits you
match FAIL10 Struck by vertigo
match retreat engaged
put climb narrow track
matchwait

FAIL10:
pause
goto CLIMB12

CLIMB11:
SAVE CLIMB11
pause
match CLIMB12 Angling sharply, the track dips
match FALLEN slip after a few feet
match FALLEN You must be standing
match CLIMB11 steepness is intimidating
match CLIMB11 can't seem to find purchase
match CLIMB11 find it hard going.
match CLIMB11 your footing is questionable
match CLIMB11 A wave of dizziness hits you
match CLIMB11 Struck by vertigo
match retreat engaged
put climb narrow track
matchwait

CLIMB12:
SAVE CLIMB12
pause
match PASS12 Bordering the ravine, the track
match FALLEN slip after a few feet
match FALLEN You must be standing
match CLIMB12 steepness is intimidating
match CLIMB12 can't seem to find purchase
match CLIMB12 find it hard going.
match CLIMB12 your footing is questionable
match CLIMB12 A wave of dizziness hits you
match CLIMB12 Struck by vertigo
match retreat engaged
put climb steep trail
matchwait

FAIL09:
PASS12:
move n
move se
move n
move ne
move se
move go narrow track
move e
move e
move e
move se
move e
move ne
move n
move se
move climb bluff
move ne
move e
move se
move e
move climb narrow path
move ne
move e
move ne
move e
move se
move ne
move ne
move e
move e
move se
move ne
move ne
move e
move e
move se
move ne
move e
move e
move e
move e
move e
move se
move ne
move e
move e
move se
move e
move se
move se
move s
move sw
move s
move sw
move sw
move sw
move s
move se
move se
move s
move se
move s
move e
move se
move s
move se
move e
move e
move e
move e
move e
move go gate
move n
move ne
move ne
move ne
move e
move e
ReturningFromNorthGate:
move e
move e
move se
move se
move se
move s
move climb ladder
goto CheckLearning

CheckLearning:
pause
put exp athletic
match Done enthralled
match Done nearly locked
match Done mind lock
match StartScript EXP HELP for more information
matchwait


GoNorthGate:
move n
move ne
move ne
move ne
move e
move e
move go gate
move n
move n
move n
move n
move n
move ne
move nw
move nw
move n
move n
move e
move e
move ne
move e
move e
move n
move ne
move ne
move ne
move n
move ne
move ne
move n
move n
move ne
move ne
move n
move n
move ne
move n
move ne
move n
move ne
move e
move ne
move e
move e
move ne
move go woodland path
move nw
move go path
move ne
move nw
move n
move ne
move w
move w
move go crevice
move go woodlands
move ne
move ne
move n
move ne
move n
move n

CLIMB13:
SAVE CLIMB13
match CLIMB14 Willowy branches reach out
match CantClimbLog steepness is intimidating
match CantClimbLog can't seem to find purchase
match CantClimbLog find it hard going.
match CantClimbLog your footing is questionable
match CantClimbLog A wave of dizziness hits you
match CantClimbLog Struck by vertigo
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
put climb fallen log
matchwait

CLIMB14:
SAVE CLIMB14
match PASS14 Utter stillness and the grandiose play of nature
match FALLEN slip after a few feet
match FALLEN You must be standing
match FAIL14 steepness is intimidating
match FAIL14 can't seem to find purchase
match FAIL14 find it hard going.
match FAIL14 your footing is questionable
match FAIL14 A wave of dizziness hits you
match FAIL14 Struck by vertigo
match retreat engaged
match PAUSE ...wait
put climb embankment
matchwait

PASS14:
move sw
move s
move down
move down
goto CLIMB15

CLIMB15:
SAVE CLIMB15
match PASS15 Deep, narrow crevasses form
match FALLEN slip after a few feet
match FALLEN You must be standing
match FAIL15 steepness is intimidating
match FAIL15 can't seem to find purchase
match FAIL15 find it hard going.
match FAIL15 your footing is questionable
match FAIL15 A wave of dizziness hits you
match FAIL15 Struck by vertigo
match retreat engaged
match PAUSE ...wait
put climb slanted ledge
matchwait

PASS15:
move up
goto CLIMB16

FAIL15:
move down
goto CLIMB18

CLIMB16:
SAVE CLIMB16
match CLIMB17 [Undergondola, Deep Pit]
match FALLEN slip after a few feet
match FALLEN You must be standing
match FAIL16 steepness is intimidating
match FAIL16 can't seem to find purchase
match FAIL16 find it hard going.
match FAIL16 your footing is questionable
match FAIL16 A wave of dizziness hits you
match FAIL16 Struck by vertigo
match retreat engaged
match PAUSE ...wait
put climb pit
matchwait

FAIL16:
goto PASS17

CLIMB17:
SAVE CLIMB17
match PASS17 Pocketing the face of the cliffs are
match FALLEN slip after a few feet
match FALLEN You must be standing
match PAUSE steepness is intimidating
match PAUSE can't seem to find purchase
match PAUSE find it hard going.
match PAUSE your footing is questionable
match PAUSE A wave of dizziness hits you
match PAUSE Struck by vertigo
match retreat engaged
match PAUSE ...wait
put climb opening
matchwait

PASS17:
move up
move down
move down
goto CLIMB18

CLIMB18:
SAVE CLIMB18
match PASS18 Chilly breezes caress your face,
match FALLEN slip after a few feet
match FALLEN You must be standing
match FAIL18 steepness is intimidating
match FAIL18 can't seem to find purchase
match FAIL18 find it hard going.
match FAIL18 your footing is questionable
match FAIL18 A wave of dizziness hits you
match FAIL18 Struck by vertigo
match retreat engaged
match PAUSE ...wait
put climb narrow rift
matchwait

PASS18:
move down
goto CLIMB19

CLIMB19:
SAVE CLIMB19
match PASS19 A pair of mockingbirds perches
match FALLEN slip after a few feet
match FALLEN You must be standing
match FAIL19 steepness is intimidating
match FAIL19 can't seem to find purchase
match FAIL19 find it hard going.
match FAIL19 your footing is questionable
match FAIL19 A wave of dizziness hits you
match FAIL19 Struck by vertigo
match retreat engaged
match PAUSE ...wait
put climb slanted ledge
matchwait

PASS19:
move down
goto CLIMB20

CLIMB20:
SAVE CLIMB20
match PASS20 Water trickles slowly in patches
match FALLEN slip after a few feet
match FALLEN You must be standing
match FAIL20 steepness is intimidating
match FAIL20 can't seem to find purchase
match FAIL20 find it hard going.
match FAIL20 your footing is questionable
match FAIL20 A wave of dizziness hits you
match FAIL20 Struck by vertigo
match retreat engaged
match PAUSE ...wait
put climb rocky overhang
matchwait

PASS20:
move down
goto CLIMB21

CLIMB21:
SAVE CLIMB21
match PASS21 Clusters of moss peek out
match FALLEN slip after a few feet
match FALLEN You must be standing
match FAIL21 steepness is intimidating
match FAIL21 can't seem to find purchase
match FAIL21 find it hard going.
match FAIL21 your footing is questionable
match FAIL21 A wave of dizziness hits you
match FAIL21 Struck by vertigo
match retreat engaged
match PAUSE ...wait
put climb rock face
matchwait

PASS21:
move down
goto CLIMB22

CLIMB22:
SAVE CLIMB22
match CLIMB23 Clay and limestone form
match FALLEN slip after a few feet
match FALLEN You must be standing
match FAIL22 steepness is intimidating
match FAIL22 can't seem to find purchase
match FAIL22 find it hard going.
match FAIL22 your footing is questionable
match FAIL22 A wave of dizziness hits you
match FAIL22 Struck by vertigo
match retreat engaged
match PAUSE ...wait
put climb rocky crag
matchwait

CLIMB23:
SAVE CLIMB23
match PASS23 Firm handholds are hard to come by
match FALLEN slip after a few feet
match FALLEN You must be standing
match PAUSE steepness is intimidating
match PAUSE can't seem to find purchase
match PAUSE find it hard going.
match PAUSE your footing is questionable
match PAUSE A wave of dizziness hits you
match PAUSE Struck by vertigo
match retreat engaged
match PAUSE ...wait
put climb rocky crag
matchwait

FAIL22:
PASS23:
move up
goto CLIMB24

CLIMB24:
SAVE CLIMB24
match PASS24 Sweet alyssum pokes its
match FALLEN slip after a few feet
match FALLEN You must be standing
match PAUSE steepness is intimidating
match PAUSE can't seem to find purchase
match PAUSE find it hard going.
match PAUSE your footing is questionable
match PAUSE A wave of dizziness hits you
match PAUSE Struck by vertigo
match retreat engaged
match PAUSE ...wait
put climb rock face
matchwait

FAIL21:
PASS24:
move up
goto CLIMB25

CLIMB25:
SAVE CLIMB25
match PASS25 The forces of nature are constantly
match FALLEN slip after a few feet
match FALLEN You must be standing
match PAUSE steepness is intimidating
match PAUSE can't seem to find purchase
match PAUSE find it hard going.
match PAUSE your footing is questionable
match PAUSE A wave of dizziness hits you
match PAUSE Struck by vertigo
match retreat engaged
match PAUSE ...wait
put climb rocky overhang
matchwait

FAIL20:
PASS25:
move up
goto CLIMB26

CLIMB26:
SAVE CLIMB26
match PASS26 The peak of the mountain comes into view
match FALLEN slip after a few feet
match FALLEN You must be standing
match PAUSE steepness is intimidating
match PAUSE can't seem to find purchase
match PAUSE find it hard going.
match PAUSE your footing is questionable
match PAUSE A wave of dizziness hits you
match PAUSE Struck by vertigo
match retreat engaged
match PAUSE ...wait
put climb slanted ledge
matchwait

FAIL19:
PASS26:
move up
goto CLIMB27

CLIMB27:
SAVE CLIMB27
match PASS27 Eroded by time and the
match FALLEN slip after a few feet
match FALLEN You must be standing
match PAUSE steepness is intimidating
match PAUSE can't seem to find purchase
match PAUSE find it hard going.
match PAUSE your footing is questionable
match PAUSE A wave of dizziness hits you
match PAUSE Struck by vertigo
match retreat engaged
match PAUSE ...wait
put climb narrow rift
matchwait

FAIL18:
PASS27:
move up
move up
move up
move n
move ne
goto CLIMB28

CLIMB28:
SAVE CLIMB28
match CLIMB29 Willowy branches reach out
match FALLEN slip after a few feet
match FALLEN You must be standing
match PAUSE steepness is intimidating
match PAUSE can't seem to find purchase
match PAUSE find it hard going.
match PAUSE your footing is questionable
match PAUSE A wave of dizziness hits you
match PAUSE Struck by vertigo
match retreat engaged
match PAUSE ...wait
put climb embankment
matchwait

FAIL14:
pause
goto CLIMB29

CLIMB29:
SAVE CLIMB29
match PASS29 Tamarisk bushes display their feathery
match FALLEN slip after a few feet
match FALLEN You must be standing
match PAUSE steepness is intimidating
match PAUSE can't seem to find purchase
match PAUSE find it hard going.
match PAUSE your footing is questionable
match PAUSE A wave of dizziness hits you
match PAUSE Struck by vertigo
match retreat engaged
match PAUSE ...wait
put climb fallen log
matchwait

PASS29:
CantClimbLog:
move s
move s
move sw
move s
move sw
move sw
move go cleft
move go crack
move e
move e
move sw
move s
move se
move sw
move go path
move se
move go wooded path
move sw
move w
move w
move sw
move w
move sw
move s
move sw
move s
move sw
move s
move s
move sw
move sw
move s
move s
move sw
move sw
move s
move sw
move sw
move sw
move s
move w
move w
move sw
move w
move w
move s
move s
move se
move se
move sw
move s
move s
move s
move s
move s
move go gate
goto ReturningFromNorthGate

======================
FALLEN:
pause
match STOOD You stand
match STOOD You are already standing
match FALLEN cannot manage to stand.
match FALLEN The weight of all your possessions
match FALLEN ...wait
put StAND
matchwait

STOOD:
goto %s

RETREAT:
match retreat You retreat back to pole range.
match retreat still stunned
match %s You retreat from combat.
match pause ...wait
match pause type ahead
put retreat
matchwait

PAUSE:
pause
goto %s

DONE:
pause
put hide
echo *** You are at least bewildering in your Climbing Skill.  Break time!
