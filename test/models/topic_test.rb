require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  def setup
  	@topic = Topic.create(title: "Test", description: "Test topic")
  end

  test "should be valid" do
    assert @topic.valid?
  end

  test "title should be present" do 
  	@topic.title = nil
  	assert_not @topic.valid?
  end

  test "description should be present" do
  	@topic.description = nil
  	assert_not @topic.valid?
  end

  test "title should not be blank" do
  	@topic.title = "          "
  	assert_not @topic.valid?
  end

   test "description should not be blank" do
  	@topic.description = "          "
  	assert_not @topic.valid?
  end
end
