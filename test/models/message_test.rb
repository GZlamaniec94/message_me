require "test_helper"

class MessageTest < ActiveSupport::TestCase
  def setup
    @message = Message.new(body: "Hello hvb", user_id: 2)
  end  
  
  
  test "body should be present" do
    @message.body = " "
    assert_not @message.valid?
  end   

  test "message should have user_id" do
    assert @message.user_id?
  end  

end
