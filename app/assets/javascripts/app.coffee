window.App ||= {}

App.scrolledToBottom = ->
  $(window).scrollTop() > $(document).height() - $(window).height() - 200

# TODO
App.loadMoreSpots = ->
  $ ->
    $('.timeline').infinitePages
      loading: ->
        $(this).text('Loading next page...')
      error: ->
        $(this).button('There was an error, please try again')

# Adjust fonts in Safari
App.adjustFonts = ->
  is_chrome = navigator.userAgent.indexOf('Chrome') > -1
  is_explorer = navigator.userAgent.indexOf('MSIE') > -1
  is_firefox = navigator.userAgent.indexOf('Firefox') > -1
  is_safari = navigator.userAgent.indexOf('Safari') > -1
  is_opera = navigator.userAgent.indexOf('Presto') > -1
  is_mac = navigator.userAgent.indexOf('Mac OS') != -1
  is_windows = !is_mac
  if is_chrome and is_safari
    is_safari = false
  if is_safari or is_windows
    $('body').css '-webkit-text-stroke', '0.5px'
  return

$(document).ready ->
  App.scrolledToBottom()
  App.loadMoreSpots()
