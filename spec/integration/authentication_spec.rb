require 'spec_helper'


describe 'Authentication' do

  before do
    @login = 'foo'
    @pass = 'bar'
    @logged = 'sign out'
  end

  it 'should serve link to sign in page for guest' do
    visit '/'
    page.should have_content('sign in')
  end

  it 'should register new user' do
    register @login, @pass
    page.should have_content(@logged)
  end

  it 'should approve registered user' do
    register @login, @pass
    login @login, @pass
    page.should have_content(@logged)
  end

  it 'should reject wrong password' do
    register @login, @pass
    login @login, @pass+'1'
    page.should_not have_content(@logged)
  end

  it 'should not register two users with the same name' do
    register @login, @pass
    register @login, @pass
    page.should_not have_content(@logged)
  end  

end

