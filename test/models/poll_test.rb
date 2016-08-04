require 'test_helper'

class PollTest < ActiveSupport::TestCase

  it "should require a poll title" do
    poll = Poll.create(:title => "")
    poll.valid?
    poll.errors.should have_key(:title)
  end
  
end
