def register user, password
  visit '/signup'
  fill_in 'Name', :with => user
  fill_in 'Password', :with => password
  fill_in 'Confirm Password', :with => password
  click_button 'Connect'
end
def login user, password
  visit '/signin'
  fill_in 'Login', with: user
  fill_in 'Password', with: password
  click_button 'Connect'
end
def add_text title, description, content
  visit new_text_path
  fill_in 'Title', with: title
  fill_in 'Description', with: description
  fill_in 'Content', with: content
  click_button 'Create Text'
end
def delete_given given
  visit path_to given, action: 'destroy'  #'Text#destroy'
end
