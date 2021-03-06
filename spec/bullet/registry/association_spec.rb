require 'spec_helper'

module Bullet
  module Registry
    describe Association do
      subject { Association.new.tap { |association| association.add(["key1", "key2"], "value") } }

      context "#merge" do
        it "should merge key/value" do
          subject.merge("key0", "value0")
          subject["key0"].should be_include("value0")
        end
      end

      context "#similarly_associated" do
        it "should return similarly associated keys" do
          subject.similarly_associated("key1", Set.new(["value"])).should == ["key1", "key2"]
        end

        it "should return empty if key does not exist" do
          subject.similarly_associated("key3", Set.new(["value"])).should be_empty
        end
      end
    end
  end
end
