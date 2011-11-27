# -*- coding: utf-8 -*-

class TweetCategorizer
  def categorize(tweet)
    body = tweet.sub(/^.+?\t/, '')
    categories = []

    CATEGORY_CONDITIONS.each do |k, v|
      categories << k if body =~ v
    end
    categories << "Normal" if categories.empty?

    "#{categories.join(',')}\t#{body}"
  end

  CATEGORY_CONDITIONS = 
    {
      "!HashTag" => /#.+/,
      "Reply" => /^@.+/,
      "Mention" => /^[^@]+@.+/
    }.freeze
end
