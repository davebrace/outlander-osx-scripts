debuglevel 5

match lookSymbol Roundtime
match lookSymbol but it won't budge
matchre turnCrank Sorry, you may
put turn crank
matchwait

lookSymbol:
  pause 1

  match DOLPHIN dolphin
  match PANTHER panther
  match CAT cat
  match RAM ram
  match COBRA cobra
  match WOLF wolf
  match BOAR boar
  match RAVEN raven
  match LION lion
  match WREN image of the wren
  matchre lookSymbol Sorry, you may

  put l star
  pause 0.5
  put l sun
  pause 0.5

  matchwait 5

WREN:
  var symbolLach wren
  var lightMatch plump opera singer
  var darkMatch cracked mirror
  goto southCoffin
  
RAM:
  var symbolLach ram
  var lightMatch flourishing rose garden
  var darkMatch jagged crystalline blade
  goto southCoffin

COBRA:
  var symbolLach cobra
  var lightMatch shattered egg
  var darkMatch erupting volcano
  goto southCoffin

LION:
  var symbolLach lion
  var lightMatch battle hounds
  var darkMatch bloodstained stiletto
  goto southCoffin

DOLPHIN:
  var symbolLach dolphin
  var lightMatch deer drinking from a flowing stream
  var darkMatch great tidal wave
  goto southCoffin

BOAR:
  var symbolLach boar
  var lightMatch image of a longbow
  var darkMatch berserking barbarian
  goto southCoffin

WOLF:
  var symbolLach wolf
  var lightMatch charred black stave
  var darkMatch long flowing skirt
  goto southCoffin

PANTHER:
  var symbolLach panther
  var lightMatch cluster of twinkling stars
  var darkMatch child shivering fearfully
  goto southCoffin

CAT: 
  var symbolLach cat
  var lightMatch grimacing woman in the throes
  var darkMatch twin crossed swords
  goto southCoffin

RAVEN:
  var symbolLach raven
  var lightMatch bowl of striped peppermint
  var darkMatch shattered caravan wheel
  goto southCoffin


southCoffin:
  match coffin2light Obvious
  matchre southCoffin /(\.\.\.wait|Sorry\,\syou\smay)/
  put s
  matchwait

coffin2light:
  move go white tap
  var return lookWheelLight
  goto %return

lookWheelLight:
  match light2dark %lightMatch
  match lookWheelLight ...wait
  match lookWheelLight Sorry, you may
  put l wheel
  matchwait 2
  goto pullRope

pullRope:
  match %return Roundtime:
  match pullRope ...wait
  match pullRope Sorry, you may
  put pull rope
  matchwait

light2dark:
  move se
  move go black tap
  var return lookWheelDark
  goto %return

lookWheelDark:
  match dark2coffin %darkMatch
  matchre pullRope /\./
  match lookWheelLight ...wait
  match lookWheelLight Sorry, you may
  put l wheel
  matchwait 2
  goto pullRope

pullRope:
  match %return Roundtime:
  match pullRope ...wait
  match pullRope Sorry, you may
  put pull rope
  matchwait

dark2coffin:
  move sw
  move n
  put pull lever
  goto lookCoffin

lookCoffin:
  match openCoffin image of the %symbolLach
  match turnCrank currently closed
  matchre lookCoffin /(\.\.\.wait|Sorry\,\syou\smay)/
  put l coffin
  matchwait

openCoffin:
  matchre goCoffin You open|is already
  matchre openCoffin /(\.\.\.wait|Sorry\,\syou\smay)/
  put open coffin
  matchwait

goCoffin:
  matchre arrivedCoffin /(You clamber|You must be)/
  matchre goCoffin /(\.\.\.wait|Sorry\,\syou\smay)/
  put go coffin
  matchwait 5

arrivedCoffin:
  echo ** DONE **
