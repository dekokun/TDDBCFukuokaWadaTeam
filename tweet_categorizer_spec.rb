# -*- coding: utf-8 -*-

require 'rubygems'
require 'rspec'
require File.expand_path(
  File.join(File.dirname(__FILE__),
      'tweet_categorizer'))

describe TweetCategorizer do
  before { @tc = TweetCategorizer.new }
  subject { @tc.categorize "Alice\tあいうえお" }
  it { should == "Normal\tあいうえお" }
end

