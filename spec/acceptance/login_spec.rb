require 'spec_helper'

feature %q{
  As a user
  I want to be able to log out
  So other users can log in
} do


  background do
    @user = FactoryGirl.create(:user)
    visit "/"
    click_link "Login"
    fill_in "user[email]", :with => @user.email
    fill_in "user[password]", :with => "draft1"
    click_button "Sign in"
  end


  scenario "Log out by clicking link", :js => true do
    click_link "Logout"
    page.should have_link("Login")
  end


end



feature %q{
  As a user
  If I am mistaken with the password
  I should see that message
} do

  background do
    @user = FactoryGirl.create(:user)
    visit "/"
    click_link "Login"
    fill_in "user[email]", :with => "some_random_mail@example.com"
    fill_in "user[password]", :with => "draft1"
    click_button "Sign in"
  end


  scenario "see the message", :js => true do
    page.should have_content("Invalid email or password.")
  end


end

