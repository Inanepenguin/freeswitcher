require 'spec/helper'
require 'fsr/cmd'

describe FSR::Cmd::Hupall do
  should "disconnect calls" do
    cmd = FSR::Cmd::Hupall.new
    cmd.raw.should == "bgapi hupall"
  end

  should "disconnect calls with cause" do
    cmd = FSR::Cmd::Hupall.new("cause3")
    cmd.raw.should == "bgapi hupall cause3"
  end
end
