# -*- coding: utf-8 -*-

class TweetCategorizer
  def categorize(tweet)
    parts = tweet.split("\t")
    parts.shift
    body = parts.join("\t")
    categories = []

    category_conditions.each do |k, v|
      categories << k if body =~ v
    end
    categories << "Normal" if categories.empty?

    "#{categories.join(',')}\t#{body}"
  end

  def category_conditions
    {
      "!HashTag" => /#.+/,
      "Reply" => /^@.+/,
      "Mention" => /^[^@]+@.+/
    }
  end
end
