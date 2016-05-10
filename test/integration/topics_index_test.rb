require 'test_helper'

class TopicsIndexTest < ActionDispatch::IntegrationTest
	def setup 
		get root_path
		@topic = topics(:one)
    end

	test "layout links" do
      assert_template 'topics/index'
      assert_select "a[href=?]", new_topic_path
      assert_select "a[href=?]", about_path
	end

	test "index table present" do
	  assert_select 'table'
	  topics = Topic.all
	  assert_select 'form.button_to'
	  assert_select 'a', text: "Delete"
	  topics.each do |topic|
        assert_select 'a[href=?]', topic_path(topic), text: topic.title
	    assert_match topic.votes.count.to_s + ' likes', response.body
        assert_match topic.downvotes.count.to_s + ' dislikes', response.body
      end
	end
  
    test "can upvote topic" do
      assert_difference '@topic.votes.count', 1 do
        post upvote_topic_path(@topic)
      end
    end

    test "can downvote topic" do
      assert_difference '@topic.downvotes.count', 1 do
      	post downvote_topic_path(@topic)
      end
    end

	test "can delete topic" do
	  assert_difference "Topic.count", -1 do
		delete topic_path(@topic)
	  end
	end

end