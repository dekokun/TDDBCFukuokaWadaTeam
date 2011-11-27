# -*- coding: utf-8 -*-

require 'rubygems'
require 'rspec'
require File.expand_path(
  File.join(File.dirname(__FILE__),
      '..',
      'lib',
      'tweet_categorizer'))

describe TweetCategorizer do
  before { @tc = TweetCategorizer.new }
  subject { @tc.categorize tweet }
  context "Normalの場合" do
    context "Alice\tあいうえお" do
      let(:tweet) { "Alice\tあいうえお" }
      it { should == "Normal\tあいうえお" }
    end
    context "Bob\tでも僕はTwitterなんて全然わからないよ。" do
      let(:tweet) { "Bob\tでも僕はTwitterなんて全然わからないよ。" }
      it { should == "Normal\tでも僕はTwitterなんて全然わからないよ。" }
    end
  end
  context "reply" do
    let(:tweet) { "Alice\t@Bob 私もよ。" }
    it { should_not =~ /^Normal/ }
    it { should == "Reply\t@Bob 私もよ。" }
  end
  context "@の後に何もない" do
    let(:tweet) { "Alice\t@" }
    it { should == "Normal\t@" }
  end
  context "Hash tag" do
    let(:tweet) { "Alice\t私もですよ。#metoo" }
    it { should == "!HashTag\t私もですよ。#metoo" }
  end
  context "Mention" do
    let(:tweet) { "Alice\t私もですよ。@Bob" }
    it { should == "Mention\t私もですよ。@Bob" }
  end
  context "Hash tag and Reply" do
    let(:tweet) { "Alice\t@Bob #Hello こんにちは" }
    it { should == "!Hashtag,Reply\t@Bob #Hello こんにちは" }
  end
end

