require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:huiwen).profile
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 on profile not found" do
  	get :show, id: "doesn't exist"
  	assert_response :not_found
  end

  test "that variables are assigned on succesful profile viewing" do
  	get :show, id: users(:huiwen).profile
  	assert assigns(:user)
  	assert_not_empty assigns(:statuses)
  end

  test "only show the corret user's statuses" do
  	get :show, id: users(:huiwen).profile
  	assigns(:statuses).each do |status|
  		assert_equal users(:huiwen), status.user
  	end
  end

end
