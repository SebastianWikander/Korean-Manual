#!/bin/env ruby
# encoding: utf-8

require 'verb'

describe Verb do
  it "should conjugate the verb 가다" do
    verb = Verb.new("가다")
    verb.present.stem.should eq("가")
    verb.present.plain.should eq("간다")
    verb.present.informal.should eq("가")
    verb.present.polite.should eq("가요")
    verb.present.formal.should eq("갑니다")
    verb.past.plain.should eq("갔다")
    verb.past.informal.should eq("갔어")
    verb.past.polite.should eq("갔어요")
    verb.past.formal.should eq("갔습니다")
    verb.future.plain.should eq("가겠다")
    verb.future.informal.should eq("가겠어")
    verb.future.polite.should eq("가겠어요")
    verb.future.formal.should eq("가겠습니다")
  end
  it "should conjugate the verb 하다" do
    verb = Verb.new("하다")
    verb.present.stem.should eq("하")
    verb.present.plain.should eq("한다")
    verb.present.informal.should eq("해")
    verb.present.polite.should eq("해요")
    verb.present.formal.should eq("합니다")
    verb.past.plain.should eq("했다")
    verb.past.informal.should eq("했어")
    verb.past.polite.should eq("했어요")
    verb.past.formal.should eq("했습니다")
    verb.future.plain.should eq("하겠다")
    verb.future.informal.should eq("하겠어")
    verb.future.polite.should eq("하겠어요")
    verb.future.formal.should eq("하겠습니다")
  end
  it "should conjugate the verb 마시다" do
    verb = Verb.new("마시다")
    verb.present.stem.should eq("마시")
    verb.present.plain.should eq("마신다")
    verb.present.informal.should eq("마셔")
    verb.present.polite.should eq("마셔요")
    verb.present.formal.should eq("마십니다")
    verb.past.plain.should eq("마셨다")
    verb.past.informal.should eq("마셨어")
    verb.past.polite.should eq("마셨어요")
    verb.past.formal.should eq("마셨습니다")
    verb.future.plain.should eq("마시겠다")
    verb.future.informal.should eq("마시겠어")
    verb.future.polite.should eq("마시겠어요")
    verb.future.formal.should eq("마시겠습니다")
  end
  it "should conjugate the verb 주다" do
    verb = Verb.new("주다")
    verb.present.stem.should eq("주")
    verb.present.plain.should eq("준다")
    verb.present.informal.should eq("주어")
    verb.present.polite.should eq("주어요")
    verb.present.formal.should eq("줍니다")
    verb.past.plain.should eq("주었다")
    verb.past.informal.should eq("주었어")
    verb.past.polite.should eq("주었어요")
    verb.past.formal.should eq("주었습니다")
    verb.future.plain.should eq("주겠다")
    verb.future.informal.should eq("주겠어")
    verb.future.polite.should eq("주겠어요")
    verb.future.formal.should eq("주겠습니다")
  end
end