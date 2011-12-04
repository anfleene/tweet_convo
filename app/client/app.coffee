# Client-side Code

# Bind to socket events
SS.socket.on 'disconnect', ->  $('#message').text('SocketStream server is down :-(')
SS.socket.on 'reconnect', ->   $('#message').text('SocketStream server is up :-)')

# This method is called automatically when the websocket connection is established. Do not rename/delete
exports.init = ->

  # Make a call to the server to retrieve a message
  SS.server.app.init (response) ->
    $('#message').text(response)

  $("form#tweet").submit ->
    tweetId = $("input#tweetId").val()

    SS.server.app.sendTweet {id : tweetId}, (response) ->
      if response.error then alert(response.error) else $("input#tweetId").val("")
    false

  SS.client.tweet.init()
