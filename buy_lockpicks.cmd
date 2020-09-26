var count 0

buy:
  if %count == 25 then { exit }
  math count add 1
  gosub order
  gosub offer
  gosub store
  goto buy

order:
  put order stout iron lockpick
  pause 1
  return

offer:
  put offer 270
  pause 1
  return

store:
  put put lockpick in my ring
  pause 1
  return
