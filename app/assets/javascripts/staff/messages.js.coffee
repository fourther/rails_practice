$(document).on 'turbolinks:load', ->
  if $('#number-of-unprocessed-messages').length
    window.setInterval(update_number_of_unprocessed_messages, 1000 * 6)

update_number_of_unprocessed_messages = ->
  $.get window.paths.number_of_unprocessed_messages, (data) ->
    $('#number-of-unprocessed-messages').text "(#{data})"