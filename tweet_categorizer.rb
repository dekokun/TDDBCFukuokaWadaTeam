# -*- coding: utf-8 -*-

class TweetCategorizer
  def categorize(tweet)
    body = tweet.split("\t")[1]
    case body
    when /#.+/
      "!HashTag\t#{body}"
    when /^@/
      "Reply\t#{body}"
    else
      "Normal\t#{body}"
    end
  end
end
