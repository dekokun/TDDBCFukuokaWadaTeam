# -*- coding: utf-8 -*-

class TweetCategorizer
  def categorize(tweet)
    body = tweet.split("\t")[1]
    "Normal\t#{body}"
  end
end
