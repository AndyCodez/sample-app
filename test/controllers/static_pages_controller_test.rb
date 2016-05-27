require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Ruby on Rails Tutorial Sample App"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
    assert_select "h2", "Contact Us"
  end

  test "should get cv" do
    get :cv
    assert_response :success
    assert_select "title", "CV | #{@base_title}"
    assert_select "h2", "Andrew Owino"
    assert_select "h3", "Welcome to My Site!"
    assert_select "h3", "Profile"
    assert_select "h3", "My Resume"
    assert_select "th", "Education"
    assert_select "h3", "Contact Me"
  end

end
