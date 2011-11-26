# -*- coding: utf-8 -*-

require 'rubygems'
require 'rspec'
require File.expand_path(
  File.join(File.dirname(__FILE__),
      'tweet_categorizer'))

describe TweetCategorizer do
  context "Alice\tあいうえお" do
    before { @tc = TweetCategorizer.new }
    subject { @tc.categorize "Alice\tあいうえお" }
    it { should == "Normal\tあいうえお" }
  end
  context "Bob\tでも僕はTwitterなんて全然わからないよ。" do
    before { @tc = TweetCategorizer.new }
    subject { @tc.categorize "Bob\tでも僕はTwitterなんて全然わからないよ。" }
    it { should == "Normal\tでも僕はTwitterなんて全然わからないよ。" }
  end
end

