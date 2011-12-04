exports.init = ->

  SS.events.on 'newTweet', (tweet) ->
    $('#templates-tweet').tmpl(tweet).appendTo('#tweets')
