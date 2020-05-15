start:
  put get tailoring book
  pause 1
  put turn book to chapter 5
  pause 1
  put turn book to page 1
  pause 1

  put study book
  wait

  put stow book
  pause 1
  put get yarn
  pause 1
  put get needles
  pause 1

  put knit my yarn with my needles
  wait

  put stow yarn
  pause 1

knit_needles:
  matchre turn Now the needles must be turned|Some ribbing should be added
  matchre push Next the needles must be pushed|ready to be pushed|the pattern is uneven and off by one
  matchre cast The garment is nearly complete and now must be cast off 
  put knit my needles
  matchwait 35
  goto knit_needles

turn:
  matchre turn Now the needles must be turned|Some ribbing should be added
  matchre push Next the needles must be pushed|ready to be pushed
  matchre cast The garment is nearly complete and now must be cast off 
  put turn my needles
  matchwait 35
  goto knit_needles

push:
  matchre turn Now the needles must be turned|Some ribbing should be added
  matchre push Next the needles must be pushed|ready to be pushed|the pattern is uneven and off by one
  matchre cast The garment is nearly complete and now must be cast off 
  put push my needles
  matchwait 35
  goto knit_needles

cast:
  put cast my needles
  pause 0.5
  wait
  put swap
  pause 1
  put drop ankle
  pause 1
  put swap
  pause 1
  if $Outfitting.LearningRate > 30 then {
    echo *** Outfitting above 30 ***
    put stow needles
    exit
  }
  goto start
