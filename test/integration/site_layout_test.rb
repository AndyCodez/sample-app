require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "layout links" do
  	get root_path
  	assert_template 'static_pages/home'
  	assert_select "a[href=?]", root_path, count: 2
  	assert_select "a[href=?]", help_path
  	assert_select "a[href=?]", about_path
  	assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", "http://news.railstutorial.org/"
    assert_select "a[href=?]", "http://rubyonrails.org/"
    assert_select "a[href=?]", "http://www.railstutorial.org/"
  	get signup_path
  	assert_select "title", full_title("Sign up")

    get login_path
    assert_select "title", full_title("Log In")
    log_in_as(@user)
    assert_redirected_to user_path(@user)
    assert_select "a[href]=?", root_path 
    
  end
end
