App.relay = App.cable.subscriptions.create "SpotsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $(data.message).insertBefore($('#today .timeline-block:first'))
