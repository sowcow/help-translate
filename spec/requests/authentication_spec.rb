require 'spec_helper'

def register user, password
  visit '/signup'
  fill_in 'Name', :with => NAME
  fill_in 'Password', :with => PASS
  fill_in 'Confirm Password', :with => PASS
  click_button 'Connect'
end
def login user, password
  visit '/signin'
  fill_in 'Login', :with => user
  fill_in 'Password', :with => password
  click_button 'Connect'  
end


describe 'Authentication' do

  NAME = 'foo' ;PASS = 'bar' ;LOGGED = 'sign out'

  it 'should register new user' do
    register NAME, PASS
    page.should have_content(LOGGED)
  end

  it 'should approve registered user' do
    register NAME, PASS
    login NAME, PASS
    page.should have_content(LOGGED)
  end

  it 'should reject wrong password' do
    register NAME, PASS
    login NAME, PASS+'1'
    page.should_not have_content(LOGGED)
  end

  it 'should not register two users with the same name' do
    register NAME, PASS
    register NAME, PASS
    page.should_not have_content(LOGGED)
  end  

end

