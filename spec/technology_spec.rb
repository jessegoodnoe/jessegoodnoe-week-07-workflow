require "rubygems"
require "bundler/setup"
require 'simplecov'
SimpleCov.start
require File.expand_path(File.dirname(__FILE__) + '/../lib/technology.rb')

describe "states" do

  subject { Technology.new } 

  it "should start unapproved" do
    subject.current_state.to_s.should == "unapproved"
  end

  context "when approved" do
    it "should be approved" do
      subject.approve!
      subject.approved?.should == true
      subject.current_state.to_s.should == "approved"
    end
    it "should not be publishable when unapproved" do
      expect { subject.publish! }.to raise_error
    end
    it "should tell us it is approved" do
      subject.approve!.should == "technology is approved"
    end
    it "can be set back to unapproved" do
      subject.approve!
      subject.unapprove!
      subject.current_state.to_s.should == "unapproved"
    end
    it "available events should be publish and unapprove" do
      subject.approve!
      subject.current_state.events.should have_key(:publish)
      subject.current_state.events.should have_key(:unapprove)
      subject.current_state.events.should have_key(:patent)
      subject.current_state.events.keys.should == [:publish,:unapprove,:patent]
    end
  end

  context "when published" do
    it "should be be published" do
      subject.approve!
      subject.publish!
      subject.current_state.to_s.should == "published"
    end
  end

  context "when patented" do
    it "is patented" do
      subject.approve!
      subject.patent!
      subject.current_state.to_s.should == "patented"
    end
    
    it "when patented, it should tell us to pay up or be sued" do
      subject.approve!
      subject.patent!.should == "pay up or be sued"
    end
    
    it "available event should be retire" do
      subject.approve!
      subject.patent!
      subject.current_state.events.should have_key(:retire)
    end
  end  
end
