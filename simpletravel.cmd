# debuglevel 5

top:
  if_1 then {
    gosub go %1
  } else {
    goto end
  }
  goto top

go:
  gosub automapper $0
  shift
  return

automapper:
  put .travel $0
  waitfor TRAVEL DONE
  echo
  echo *** You have arrived at $roomtitle ***
  echo
  pause 0.5
  return

end:
  put #flash
