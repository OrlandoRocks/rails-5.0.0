# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

App.users = App.cable.subscriptions.create "UsersChannel",
  connected: ->
    console.log 'connected'

  disconnected: ->
    console.log 'disconnected'

  received: (data) ->
    console.log data
    if data.key == 'create'
      $('#users').append data.user
    else if data.key == 'destroy'
      $('#users').find('#user_' + data.id).remove()
    else if data.key == 'update'
      $('#users').find('#user_' + data.id).replaceWith(data.user)
