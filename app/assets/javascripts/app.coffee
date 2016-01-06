window.App ||= {}

App.scrolledToBottom = ->
  $(window).scrollTop() > $(document).height() - $(window).height() - 200

App.loadMoreSpots = ->
  $ ->
    $('.timeline').infinitePages
      loading: ->
        $(this).text('Loading next page...')
      error: ->
        $(this).button('There was an error, please try again')

$(document).ready ->
  App.scrolledToBottom()
  App.loadMoreSpots()
