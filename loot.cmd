start:
  matchre get_box (coffer|trunk|chest|strongbox|skippet|caddy|crate|casket|coffin|\bbox\b)
  put look items
  matchwait 2
  goto end

get_box:
  var box_found $1
  put get %box_found
  pause 0.5
  put put %box_found in pack

end:
  put #parse LOOTING FINISHED
