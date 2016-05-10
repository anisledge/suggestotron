require 'test_helper'

class TopicsNewTest < ActionDispatch::IntegrationTest
	def setup
		@topic = topics(:one)
		get new_topic_path
	end

	test "invalid topic submission" do 
		assert_select "a[href=?]", topics_path
		assert_no_difference 'Topic.count' do
			post topics_path, topic: {
              title: "",
              description: ""
			}
        end
		assert_template 'topics/new'
	end

	test "valid topic submission" do
		
		assert_difference 'Topic.count', 1 do
			post topics_path, topic: {
              title: "Valid title",
              description: "Valid description"
			}
        end
        assert_redirected_to topics_path
    end
end

