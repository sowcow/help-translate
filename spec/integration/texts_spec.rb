require 'spec_helper'

describe 'Texts' do
  LOREM = 'lorem' 
  LOGIN = 'foo'
  PASS  = 'bar'
 
  it 'can be added by any visitor' do
    add_text LOREM, LOREM, LOREM
    page.should have_content 'was successfully created'
  end

  it 'can be edited by user, that created it' do
    register LOGIN, PASS    
    add_text LOREM, LOREM, LOREM
    click_link 'Edit'
    page.should_not have_content 'forbidden'
  end 

  it 'can''t be edited by user, that do not owns it' do
    register LOGIN, PASS    
    add_text LOREM, LOREM, LOREM
    register LOGIN+'1', PASS    
    click_link 'Edit'
    page.should have_content 'forbidden'
  end 

  it 'can''t be edited by guest, even if it was created by guest' do
    add_text LOREM, LOREM, LOREM
    click_link 'Edit'
    page.should have_content 'forbidden'
  end 
  
  it 'can be viewed by any visitor' do
    register LOGIN, PASS    
    add_text LOREM, LOREM, LOREM
    register LOGIN+'1', PASS 
    click_link 'Show'
    page.should_not have_content 'forbidden'
    visit '/signout'
    click_link 'Show'
    page.should_not have_content 'forbidden'
  end 

end
