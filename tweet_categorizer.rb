# -*- coding: utf-8 -*-

class TweetCategorizer
  def categorize(tweet)
    body = tweet.split("\t")[1]
    return "!HashTag\t#{body}" if body =~ /#.+/
    return "Reply\t#{body}" if body =~ /^@/
    "Normal\t#{body}"
  end
end
