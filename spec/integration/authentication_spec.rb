require 'spec_helper'


describe 'Authentication' do

  NAME = 'foo' ;PASS = 'bar' ;LOGGED = 'sign out'

  it 'should serve link to sign in page for guest' do
    visit '/'
    page.should have_content('sign in')
  end

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

