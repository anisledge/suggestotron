  require 'test_helper'

  class TopicsEditTest < ActionDispatch::IntegrationTest

  	def setup
  	  @topic = topics(:one)
  	  get edit_topic_path(@topic)
  	end

  	test "unsuccessful edit" do
  		assert_select 'a[href=?]', topic_path(@topic)
  		assert_select 'a[href=?]', topics_path
  		patch topic_path(@topic), topic: {
  			title: "",
            description: "Valid description"
  		}
  		assert_template 'topics/edit'
  		patch topic_path(@topic), topic: {
  			title: "Valid Title",
  			description: ""
  		}
  		assert_template 'topics/edit'
  	end

  	test "successfull edit" do
  		title = "Valid title"
  		description = "Valid description"
  		patch topic_path(@topic), topic: {
  			title: title,
  			description: description
  		}
  		assert_not flash.empty?
  		assert_redirected_to topics_path
        @topic.reload
        assert_equal title, @topic.title
        assert_equal description, @topic.description
  	end
end