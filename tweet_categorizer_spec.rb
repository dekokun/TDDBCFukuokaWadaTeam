# -*- coding: utf-8 -*-

require 'rubygems'
require 'rspec'
require File.expand_path(
  File.join(File.dirname(__FILE__),
      'tweet_categorizer'))

describe TweetCategorizer do
  before { @tc = TweetCategorizer.new }
  context "Alice\tあいうえお" do
    subject { @tc.categorize "Alice\tあいうえお" }
    it { should == "Normal\tあいうえお" }
  end
  context "Bob\tでも僕はTwitterなんて全然わからないよ。" do
    subject { @tc.categorize "Bob\tでも僕はTwitterなんて全然わからないよ。" }
    it { should == "Normal\tでも僕はTwitterなんて全然わからないよ。" }
  end
  context "reply" do
    subject { @tc.categorize "Alice\t@Bob 私もよ。" }
    it { should_not =~ /^Normal/ }
  end
end

