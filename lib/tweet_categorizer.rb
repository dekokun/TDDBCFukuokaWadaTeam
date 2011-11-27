# -*- coding: utf-8 -*-

class TweetCategorizer
  def categorize(tweet)
    body = tweet.split("\t")[1]
    categories = []
    categories << "!HashTag" if body =~ /#.+/
    categories << "Reply" if body =~ /^@.+/
    categories << "Mention" if body =~ /@.+/
    if categories.empty?
      categories << "Normal"
    end
    "#{categories.join(',')}\t#{body}"
  end
end
