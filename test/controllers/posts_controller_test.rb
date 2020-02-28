require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index1" do
    get posts_index1_url
    assert_response :success
  end

end
