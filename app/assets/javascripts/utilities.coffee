shiftWindow = ->
  scrollBy 0, -50
  return

load = ->
  if window.location.hash
    shiftWindow()
  return

window.addEventListener 'hashchange', shiftWindow
