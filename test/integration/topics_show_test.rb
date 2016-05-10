require 'test_helper'

class TopicsShowTest <ActionDispatch::IntegrationTest
	include ApplicationHelper

	def setup
		@topic = topics(:one)
	end

	test "topic display" do 
	  get topic_path(@topic)
	  assert_template 'topics/show'
	  assert_select 'h1', text: "Title: " + @topic.title
      assert_match "#{@topic.description}", response.body
      assert_select 'a[href=?]', topics_path
      assert_select 'a[href=?]', edit_topic_path(@topic)
    end
		
end