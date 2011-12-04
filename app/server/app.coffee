# Server-side Code

exports.actions =

  init: (cb) ->
    cb "Convo Tweet"

  # Quick Chat Demo
  sendTweet: (tweet, cb) ->
    if tweet.id.length > 0                             # Check for blank messages
      getTweets(tweet.id)
      SS.publish.broadcast 'newTweet', tweet      # Broadcast the message to everyone
      cb true                                         # Confirm it was sent to the originating client
    else
      cb false

getTweets = (tweetId) ->
  options =
    host: "api.twitter.com"
    path: "/1/related_results/show/#{tweetId}.json?include_entities=1"
    port: 80
    method: "GET"
  http.get(options, function(res) {
  console.log("Got response: " + res.statusCode);
}).on('error', function(e) {
  console.log("Got error: " + e.message);
});
