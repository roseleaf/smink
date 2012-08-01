require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get name:string" do
    get :name:string
    assert_response :success
  end

  test "should get password:string" do
    get :password:string
    assert_response :success
  end

end
