import tweepy

consumer_key = '54ztYue74TjXzOHKZroxN4JGS'
consumer_secret = 'uuH3T2GTHRgUtFFJScHfJU5LxyM5P74O0Ij9y143YMwB7esG3b'
access_token = '362598944-vytdOn25slMcZ424hDQccvZoeuLmJo7SBIo6zoPK'
access_secret = 'ntsVs0kTUfTz719hoLP6MOYEQRH517bqTweqsKJfy48kv'

auth = tweepy.OAuthHandler(consumer_key,consumer_secret)
auth.set_access_token(access_token,access_secret)

api = tweepy.API(auth)

query = '#ValdiviaCL'

public_tweets = api.home_timeline()
cl_users = api.search_users(query,20,10)

for tweet in cl_users:
    print(tweet.name)