### BEGIN EDITABLE AREAS ###

### NUGGET AND DEED STOWAGE ###
setvariable stow1 put
setvariable stow2 in my
setvariable stow3 backpack
setvariable stow4 put
setvariable stow5 in my
setvariable stow6 backpack

### DEED PACKET USE AND STOWAGE ###
#setvariable packet STOW_PROSPECT
#setvariable packet NP_PROSPECT
setvariable packet YP_PROSPECT
setvariable packetstow1 put
setvariable packetstow2 in my
setvariable packetstow3 backpack

### YOUR MINING TOOL TYPE AND STOWAGE ###
setvariable tool shovel
setvariable toolstow1 put
setvariable toolstow2 in my
setvariable toolstow3 backpack

### WHAT ORE ARE YOU GOING TO MINE ###

setvariable ore UNCOMMON
# setvariable ore COMMON

### END EDITABLE AREAS ###



START:
pause 1
goto %ore

UNCOMMON:
  setvariable oretype1 DANGER2
  setvariable oretype2 PDANGER2
  setvariable oretype3 YPDANGER2
  goto MINEPREP

COMMON:
  setvariable oretype1 NUGGET1
  setvariable oretype2 NUGGET2
  setvariable oretype3 NUGGET3
  goto MINEPREP

MINEPREP:
  put get my %tool
  pause 1
  put prospect careful
  pause 1
  goto %packet


STOW_PROSPECT:
pause 1
put prospect
match STOW_PROSPECT ...wait
match MINE No miners
match MINE Miners stand ready
match PAUSE Roundtime
matchwait


NP_PROSPECT:
pause 1
put prospect
match NP_PROSPECT ...wait
match PMINE No miners
match PMINE Miners stand ready
match PAUSE Roundtime
matchwait


YP_PROSPECT:
pause 1
put prospect
match YP_PROSPECT ...wait
match YPMINE No miners
match YPMINE Miners stand ready
match YPPAUSE Roundtime
matchwait


MINE:
put mine
match MINE ...wait
match MINEPREP actual mining tool
match DANGER2 unsalvageable
match BLANK mind goes blank
match DEAD Every muscle in your chest
match REPAIR gouged and bent
match WOUNDED clear off your feet
match BLANK world goes black
match WOUNDED hurling you into the air
match DANGER2 usefulness
match WOUNDED try to take cover
match WOUNDED razor-sharp stone fragments
match DANGER2 to mine for some time
match BURIED pinned in place
match BURIED unable to move
match DANGER2 pebble topples
match DANGER2 rock topples
match DANGER2 stone topples
match DANGER2 boulder topples
match %oretype1 copper nugget
match %oretype1 zinc nugget
match %oretype1 tin nugget
match %oretype1 covellite nugget
match %oretype1 coal nugget
match %oretype1 iron nugget
match %oretype1 lead nugget
match %oretype1 nickel nugget
match %oretype1 oravir nugget
match TEAR tear
match LUMP lump
match PNUGGET platinum nugget
match SNUGGET silver nugget
match GNUGGET gold nugget
match FRAGMENT fragment are
match FRAGMENT fragment falls
match SHARD shard
match DANGER1 Roundtime
matchwait

BLANK:
ECHO ###### YOU GOT KNOCKED OUT HAHAHAHAHAHA WAITING A MINUTE FOR YOU TO WAKE UP ######
pause 60
put stand
pause 1
goto DANGER2

DEAD:
ECHO ###### SHOULD HAVE PAID BETTER ATTENTION BECUASE NOW YOUR DEAD ######
exit

REPAIR:
ECHO ###### YOUR TOOLS ARE MESSED UP PAUSING 2 MINUTES TO ALLOW FOR REPAIRS ######
pause 120
goto DANGER2

WOUNDED:
ECHO ###### YOU GOT HURT CHECK YOURSELF ######
pause 60
put stand
pause 1
goto DANGER2

BURIED:
ECHOE ###### YOUR IN A CAVE IN HOPE TO CHADATRU YOU CAN DIG OUT ######
pause 120
goto DANGER2

DANGER1:
pause 1
put Prospect Danger
match DANGER1 ...wait
match MINE Using a discarded stone
match MINE nothing of concern
match DANGER1 unable to find any way
matchwait

DANGER2:
pause 1
put Prospect Danger
match DANGER2 ...wait
match PROSPECT Using a discarded stone
match PROSPECT nothing of concern
match DANGER2 unable to find any way
matchwait


PROSPECT:
pause 1
put prospect
match PROSPECT ...wait
match MINE No miners
match MINE Miners stand ready
match PAUSE Roundtime
matchwait

PAUSE:
ECHO ###### WAITING FOR ORE TO RESPAWN ######
pause 120
goto PROSPECT2

PROSPECT2:
pause 1
put prospect careful
pause 1
put prospect
match PROSPECT2 ...wait
match DANGER1 No miners
match DANGER1 Miners stand ready
match PAUSE Roundtime
matchwait

NUGGET1:
pause 1
put take nugget
pause 1
put %stow1 nugget %stow2 %stow3
pause 1
goto DANGER2

TEAR:
pause 1
put take tear
pause 1
put %stow1 tear %stow2 %stow3
pause 1
goto DANGER2

SHARD:
pause 1
put take shard
pause 1
put %stow1 shard %stow2 %stow3
pause 1
goto DANGER2

FRAGMENT:
pause 1
put take fragment
pause 1
put %stow1 fragment %stow2 %stow3
pause 1
goto DANGER2

LUMP:
pause 1
put take lump
pause 1
put %stow1 lump %stow2 %stow3
pause 1
goto DANGER2

PNUGGET:
pause 1
put take platinum nugget
pause 1
put %stow1 platinum nugget %stow2 %stow3
pause 1
goto DANGER2

SNUGGET:
pause 1
put take silver nugget
pause 1
put %stow1 silver nugget %stow2 %stow3
pause 1
goto DANGER2

GNUGGET:
pause 1
put take gold nugget
pause 1
put %stow1 gold nugget %stow2 %stow3
pause 1
goto DANGER2

PMINE:
put mine
match PMINE ...wait
match MINEPREP actual mining tool
match PDANGER2 unsalvageable
match PBLANK mind goes blank
match PDEAD Every muscle in your chest
match PREPAIR gouged and bent
match PWOUNDED clear off your feet
match PBLANK world goes black
match PWOUNDED hurling you into the air
match PDANGER2 usefulness
match PWOUNDED try to take cover
match PWOUNDED razor-sharp stone fragments
match PDANGER2 to mine for some time
match PBURIED pinned in place
match PBURIED unable to move
match PDANGER2 pebble topples
match PDANGER2 rock topples
match PDANGER2 stone topples
match PDANGER2 boulder topples
match %oretype2 copper nugget
match %oretype2 zinc nugget
match %oretype2 tin nugget
match %oretype2 covellite nugget
match %oretype2 coal nugget
match %oretype2 iron nugget
match %oretype2 lead nugget
match %oretype2 nickel nugget
match %oretype2 oravir nugget
match PTEAR tear
match PLUMP lump
match PPNUGGET platinum nugget
match PSNUGGET silver nugget
match PGNUGGET gold nugget
match PFRAGMENT fragment are
match PFRAGMENT fragment falls
match PSHARD shard
match PDANGER1 Roundtime
matchwait

PBLANK:
ECHO ###### YOU GOT KNOCKED OUT HAHAHAHAHAHA WAITING A MINUTE FOR YOU TO WAKE UP ######
pause 60
put stand
pause 1
goto PDANGER2

PDEAD:
ECHO ###### SHOULD HAVE PAID BETTER ATTENTION BECUASE NOW YOUR DEAD ######
exit

PREPAIR:
ECHO ###### YOUR TOOLS ARE MESSED UP PAUSING 2 MINUTES TO ALLOW FOR REPAIRS ######
pause 120
goto PDANGER2

PWOUNDED:
ECHO ###### YOU GOT HURT CHECK YOURSELF ######
pause 60
put stand
pause 1
goto PDANGER2

PBURIED:
ECHOE ###### YOUR IN A CAVE IN HOPE TO CHADATRU YOU CAN DIG OUT ######
pause 120
goto PDANGER2

PDANGER1:
pause 1
put Prospect Danger
match PDANGER1 ...wait
match PMINE Using a discarded stone
match PMINE nothing of concern
match PDANGER1 unable to find any way
matchwait

PDANGER2:
pause 1
put Prospect Danger
match PPDANGER2 ...wait
match PPROSPECT Using a discarded stone
match PPROSPECT nothing of concern
match PDANGER2 unable to find any way
matchwait

PPROSPECT:
pause 1
put prospect
match PPROSPECT ...wait
match PMINE No miners
match PMINE Miners stand ready
match PPAUSE Roundtime
matchwait

PPAUSE:
ECHO ###### WAITING FOR ORE TO RESPAWN ######
pause 120
goto PPROSPECT2

PPROSPECT2:
pause 1
put prospect careful
pause 1
put prospect
match PPROSPECT2 ...wait
match PDANGER1 No miners
match PDANGER1 Miners stand ready
match PPAUSE Roundtime
matchwait


NUGGET2:
pause 1
put push nugget
match STOW hands you a deed
match MPNUGGET lack the money
matchwait

MPNUGGET:
pause 1
put take nugget
pause 1
put %stow1 nugget %stow2 %stow3
pause 1
goto PDANGER2

PTEAR:
pause 1
put push tear
match STOW hands you a deed
match MPTEAR lack the money
matchwait

MPTEAR:
pause 1
put take tear
pause 1
put %stow1 tear %stow2 %stow3
pause 1
goto PDANGER2

PSHARD:
pause 1
put push shard
match STOW hands you a deed
match MPSHARD lack the money
matchwait

MPSHARD:
pause 1
put take shard
pause 1
put %stow1 shard %stow2 %stow3
pause 1
goto PDANGER2

PFRAGMENT:
pause 1
put push fragment
match STOW hands you a deed
match MPFRAGMENT lack the money
matchwait

MPFRAGMENT:
pause 1
put take fragment
pause 1
put %stow1 fragment %stow2 %stow3
pause 1
goto PDANGER2

PLUMP:
pause 1
put push lump
match STOW hands you a deed
match MPLUMP lack the money
matchwait

MPLUMP:
pause 1
put take lump
pause 1
put %stow1 lump %stow2 %stow3
pause 1
goto PDANGER2

PPNUGGET:
pause 1
put push platinum nugget
match STOW hands you a deed
match MPPNUGGET lack the money
matchwait

MPPNUGGET:
pause 1
put take platinum nugget
pause 1
put %stow1 platinum nugget %stow2 %stow3
pause 1
goto PDANGER2

PSNUGGET:
pause 1
put push silver nugget
match STOW hands you a deed
match MPSNUGGET lack the money
matchwait

MPSNUGGET:
pause 1
put take silver nugget
pause 1
put %stow1 silver nugget %stow2 %stow3
pause 1
goto PDANGER2


PGNUGGET:
pause 1
put push gold nugget
match STOW hands you a deed
match MPGNUGGET lack the money
matchwait

MPGNUGGET:
pause 1
put take gold nugget
pause 1
put %stow1 gold nugget %stow2 %stow3
pause 1
goto PDANGER2

STOW:
put %stow4 deed %stow5 %stow6
match PDANGER2 You put
match PDANGER2 What were
matchwait


YPMINE:
put mine
match YPMINE ...wait
match MINEPREP actual mining tool
match YPDANGER2 unsalvageable
match YPBLANK mind goes blank
match YPDEAD Every muscle in your chest
match YPREPAIR gouged and bent
match YPWOUNDED clear off your feet
match YPBLANK world goes black
match YPWOUNDED hurling you into the air
match YPDANGER2 usefulness
match YPWOUNDED try to take cover
match YPWOUNDED razor-sharp stone fragments
match YPDANGER2 to mine for some time
match YPBURIED pinned in place
match YPBURIED unable to move
match YPDANGER2 pebble topples
match YPDANGER2 rock topples
match YPDANGER2 stone topples
match YPDANGER2 boulder topples
match %oretype3 copper nugget
match %oretype3 zinc nugget
match %oretype3 tin nugget
match %oretype3 covellite nugget
match %oretype3 coal nugget
match %oretype3 iron nugget
match %oretype3 lead nugget
match %oretype3 nickel nugget
match %oretype3 oravir nugget
match YPTEAR tear
match YPLUMP lump
match YPPNUGGET platinum nugget
match YPSNUGGET silver nugget
match YPGNUGGET gold nugget
match YPFRAGMENT fragment are
match YPFRAGMENT fragment falls
match YPSHARD shard
match YPDANGER1 Roundtime
matchwait

YPBLANK:
ECHO ###### YOU GOT KNOCKED OUT HAHAHAHAHAHA WAITING A MINUTE FOR YOU TO WAKE UP ######
pause 60
put stand
pause 1
goto YPDANGER2

YPDEAD:
ECHO ###### SHOULD HAVE PAID BETTER ATTENTION BECUASE NOW YOUR DEAD ######
exit

YPREPAIR:
ECHO ###### YOUR TOOLS ARE MESSED UP PAUSING 2 MINUTES TO ALLOW FOR REPAIRS ######
pause 120
goto YPDANGER2

YPWOUNDED:
ECHO ###### YOU GOT HURT CHECK YOURSELF ######
pause 60
put stand
pause 1
goto YPDANGER2

YPBURIED:
ECHOE ###### YOUR IN A CAVE IN HOPE TO CHADATRU YOU CAN DIG OUT ######
pause 120
goto YPDANGER2

YPDANGER1:
pause 1
put Prospect Danger
match YPDANGER1 ...wait
match YPMINE Using a discarded stone
match YPMINE nothing of concern
match YPDANGER1 unable to find any way
matchwait

YPDANGER2:
pause 1
put Prospect Danger
match YPDANGER2 ...wait
match YPPROSPECT Using a discarded stone
match YPPROSPECT nothing of concern
match YPDANGER2 unable to find any way
matchwait

YPPROSPECT:
pause 1
put prospect
match YPPROSPECT ...wait
match YPMINE No miners
match YPMINE Miners stand ready
match YPPAUSE Roundtime
matchwait

YPPAUSE:
ECHO ###### WAITING FOR ORE TO RESPAWN ######
pause 120
goto YPPROSPECT2

YPPROSPECT2:
pause 1
put prospect careful
pause 1
put prospect
match YPPROSPECT2 ...wait
match YPDANGER1 No miners
match YPDANGER1 Miners stand ready
match YPPAUSE Roundtime
matchwait


NUGGET3:
pause 1
put %toolstow1 %tool %toolstow2 %toolstow3
match NUGGET31 you put
match NUGGET31 What were
match NUGGET31 Stow what
matchwait

NUGGET31:
pause 1
put take my deed packet
match NUGGET32 You get
match NUGGET32 You are already
match YPMPNUGGET3 What do
matchwait

NUGGET32:
pause 1
put push nugget with my deed packet
match NUGGET3_STOW for your records
match NUGGET31 You must be
matchwait

NUGGET3_STOW:
put %stow4 deed %stow5 %stow6
match YPSTOW You put
matchwait

YPMPNUGGET3:
pause 1
put take nugget
pause 1
put %stow1 nugget %stow2 %stow3
pause 1
goto YPTOOLGET

YPTEAR:
pause 1
put %toolstow1 %tool %toolstow2 %toolstow3
match YPTEAR2 you put
match YPTEAR2 What were
match YPTEAR2 Stow what
matchwait

YPTEAR2:
pause 1
put take my deed packet
match YPTEAR3 You get
match YPTEAR3 You are already
match YPMPTEAR What do
matchwait

YPTEAR3:
pause 1
put push tear with my deed packet
match TEAR_STOW for your records
match YPTEAR2 You must be
matchwait

TEAR_STOW:
put %stow4 deed %stow5 %stow6
match YPSTOW You put
matchwait

YPMPTEAR:
pause 1
put take tear
pause 1
put %stow1 tear %stow2 %stow3
pause 1
goto YPTOOLGET

YPSHARD:
pause 1
put %toolstow1 %tool %toolstow2 %toolstow3
match YPSHARD2 you put
match YPSHARD2 What were
match YPSHARD2 Stow what
matchwait

YPSHARD2:
pause 1
put take my deed packet
match YPSHARD3 you get
match YPSHARD3 You are already
match YPMPSHARD What do
matchwait

YPSHARD3:
pause 1
put push shard with my deed packet
match SHARD_STOW for your records
match YPSHARD2 You must be
matchwait

SHARD_STOW:
put %stow4 deed %stow5 %stow6
match YPSTOW You put
matchwait

YPMPSHARD:
pause 1
put take shard
pause 1
put %stow1 shard %stow2 %stow3
pause 1
goto YPTOOLGET

YPFRAGMENT:
pause 1
put %toolstow1 %tool %toolstow2 %toolstow3
match YPFRAGMENT2 you put
match YPFRAGMENT2 What were
match YPFRAGMENT2 Stow what
matchwait

YPFRAGMENT2:
pause 1
put take my deed packet
match YPFRAGMENT3 you get
match YPFRAGMENT3 You are already
match YPMPFRAGMENT What do
matchwait

YPFRAGMENT3:
pause 1
put push fragment with my deed packet
match FRAGMENT_STOW for your records
match YPFRAGMENT2 You must be
matchwait

FRAGMENT_STOW:
put %stow4 deed %stow5 %stow6
match YPSTOW You put
matchwait

YPMPFRAGMENT:
pause 1
put take fragment
pause 1
put %stow1 fragment %stow2 %stow3
pause 1
goto YPTOOLGET

YPLUMP:
pause 1
put %toolstow1 %tool %toolstow2 %toolstow3
match YPLUMP2 you put
match YPLUMP2 What were
match YPLUMP2 Stow what
matchwait

YPLUMP2:
pause 1
put take my deed packet
match YPLUMP3 you get
match YPMPLUMP What do
matchwait

YPLUMP3:
pause 1
put push lump with my deed packet
match LUMP_STOW for your records
match YPLUMP2 You must be
matchwait

LUMP_STOW:
put %stow4 deed %stow5 %stow6
match YPSTOW You put
matchwait

YPMPLUMP:
pause 1
put take lump
pause 1
put %stow1 lump %stow2 %stow3
pause 1
goto YPTOOLGET

YPPNUGGET:
pause 1
put %toolstow1 %tool %toolstow2 %toolstow3
match YPPNUGGET2 you put
match YPPNUGGET2 What were
match YPPNUGGET2 Stow what
matchwait

YPPNUGGET2:
pause 1
put take my deed packet
match YPPNUGGET3 you get
match YPPNUGGET3 You are already
match YPMPPNUGGET What do
matchwait

YPPNUGGET3:
pause 1
put push platinum nugget with my deed packet
match PNUGGET_STOW for your records
match YPPNUGGET2 You must be
matchwait

PNUGGET_STOW:
put %stow4 deed %stow5 %stow6
match YPSTOW You put
matchwait

YPMPPNUGGET:
pause 1
put take platinum nugget
pause 1
put %stow1 platinum nugget %stow2 %stow3
pause 1
goto YPTOOLGET

YPSNUGGET:
pause 1
put %toolstow1 %tool %toolstow2 %toolstow3
match YPSNUGGET2 you put
match YPSNUGGET2 What were
match YPSNUGGET2 Stow what
matchwait

YPSNUGGET2:
pause 1
put take my deed packet
match YPSNUGGET3 you get
match YPSNUGGET3 You are already
match YPMPSNUGGET What do
matchwait

YPSNUGGET3:
pause 1
put push silver nugget with my deed packet
match SNUGGET_STOW for your records
match YPSNUGGET2 You must be
matchwait

SNUGGET_STOW:
put %stow4 deed %stow5 %stow6
match YPSTOW You put
matchwait

YPMPSNUGGET:
pause 1
put take silver nugget
pause 1
put %stow1 silver nugget %stow2 %stow3
pause 1
goto YPTOOLGET

YPGNUGGET:
pause 1
put %toolstow1 %tool %toolstow2 %toolstow3
match YPGNUGGET2 you put
match YPGNUGGET2 What were
match YPGNUGGET2 Stow what
matchwait

YPGNUGGET2:
pause 1
put take my deed packet
match YPGNUGGET3 you get
match YPGNUGGET3 You are already
match YPMPGNUGGET What do
matchwait

YPGNUGGET3:
pause 1
put push gold nugget with my deed packet
match GNUGGET_STOW for your records
match YPGNUGGET2 You must be
matchwait

GNUGGET_STOW:
put %stow4 deed %stow5 %stow6
match YPSTOW You put
matchwait

YPMPGNUGGET:
pause 1
put take gold nugget
pause 1
put %stow1 gold nugget %stow2 %stow3
pause 1
goto YPTOOLGET

YPSTOW:
pause 1
put %packetstow1 deed packet %packetstow2 %packetstow3
match YPTOOLGET You put
match YPTOOLGET What were
match YPTOOLGET Stow what
matchwait


YPTOOLGET:
pause 1
put get my %tool
match YPDANGER2 You get
match YPDANGER2 You already
match TOOL_ERROR What do
matchwait

PUSH_ERROR:
ECHO ###### THERE IS SOMETHING WRONG WITH YOU PUSHING ORE, ENDING THE SCRIPT SO YOU CAN FIGURE IT OUT ######
exit

TOOL_ERROR:
ECHO ###### FIND YOUR TOOL TO CONTINUE ######
match YPDANGER2 You get
match YPDANGER2 shovel in your
match YPDANGER2 pickaxe in your
matchwait

