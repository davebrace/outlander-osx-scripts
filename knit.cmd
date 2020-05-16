start:
  put get tailoring book
  pause 0.5
  put turn book to chapter 5
  pause 0.5
  put turn book to page 1
  pause 0.5

  put study book
  wait

  pause 0.5
  put stow book
  goto get_yarn
  pause 0.5
  put get needles
  pause 0.5

  put knit my yarn with my needles
  wait

  pause 0.5
  put stow yarn
  pause 0.5

get_yarn:
  pause 0.5
  match out_of_yarn What were you referring to
  match return You get some
  put get yarn
  matchwait

out_of_yarn:
  echo *** Need to buy more yarn ***
  put stow needles
  put #beep
  exit

knit_needles:
  pause 0.5
  matchre turn Now the needles must be turned|Some ribbing should be added
  matchre push Next the needles must be pushed|ready to be pushed|the pattern is uneven and off by one
  matchre cast The garment is nearly complete and now must be cast off 
  match knit_needles ...wait
  match knit_needles Roundtime
  put knit my needles
  matchwait 35
  goto knit_needles

turn:
  pause 0.5
  matchre turn Now the needles must be turned|Some ribbing should be added
  matchre push Next the needles must be pushed|ready to be pushed
  matchre cast The garment is nearly complete and now must be cast off 
  match turn ...wait
  match knit_needles Roundtime
  put turn my needles
  matchwait 35
  goto knit_needles

push:
  pause 0.5
  matchre turn Now the needles must be turned|Some ribbing should be added
  matchre push Next the needles must be pushed|ready to be pushed|the pattern is uneven and off by one
  matchre cast The garment is nearly complete and now must be cast off 
  match push ...wait
  match knit_needles Roundtime
  put push my needles
  matchwait 35
  goto knit_needles

cast:
  put cast my needles
  pause 0.5
  wait
  put swap
  pause 0.5
  put drop ankle
  pause 0.5
  put swap
  pause 0.5
  if $Outfitting.LearningRate > 30 then {
    echo *** Outfitting above 30 ***
    put stow needles
    exit
  }
  goto start
