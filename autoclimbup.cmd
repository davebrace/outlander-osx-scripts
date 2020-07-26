action send climb up when ^\.\.\.wait|^Sorry
action send climb up when ^You work your way about
action send climb up when ^You slip but catch yourself.
action send climb up when ^You work your way around
action instant goto doneClimbing when ^You climb over the top

send climb up
waitforre ^Obvious

doneClimbing:
  put #parse MOVE SUCCESSFUL
