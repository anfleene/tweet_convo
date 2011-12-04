### QUICK CHAT DEMO ####

# Delete this file once you've seen how the demo works

exports.init = ->

  $('#tweet').show().submit ->
    tweet = {id : $('#tweetId').val() }
    if tweet.id.length > 0
      SS.server.app.sendTweet tweet, (success) ->
        if success then $('#tweetID').val('') else alert('Unable to send message')
    else
      alert('Oops! You must type a message first')
