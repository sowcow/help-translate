require 'spec_helper'

describe 'Text' do
  before do
    @lorem = 'lorem...'
    @login = 'foo'
    @pass = 'bar'
  end
 
  it 'can be added by any visitor' do
    add_text @lorem, @lorem, @lorem
    page.should have_content 'was successfully created'
  end

  it 'can be edited by user, that created it' do
    register @login, @pass    
    add_text @lorem, @lorem, @lorem
    click_link 'Edit'
    page.should_not have_content 'forbidden'
  end 

  it 'can''t be edited by user, that do not owns it' do
    register @login, @pass    
    add_text @lorem, @lorem, @lorem
    register @login+'1', @pass    
    click_link 'Edit'
    page.should have_content 'forbidden'
  end 

  it 'can''t be edited by guest, even if it was created by guest' do
    add_text @lorem, @lorem, @lorem
    click_link 'Edit'
    page.should have_content 'forbidden'
  end 
  
  it 'can be viewed by any visitor' do
    register @login, @pass    
    add_text @lorem, @lorem, @lorem
    register @login+'1', @pass    
    click_link 'Show'
    page.should_not have_content 'forbidden'
    visit '/signout'
    click_link 'Show'
    page.should_not have_content 'forbidden'
  end 

end
