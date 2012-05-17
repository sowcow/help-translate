describe Text do
  it 'should create list with unique words for new text' do
    text = Text.create content: 'a b c a b c a a b b c c'
    text.words.count.should == 3
  end
  it 'can be created by any one' do
    visit '/'
    click_link 'Add Text'
    page.should have_content 'New text'
  end
  it 'can be really updated by user' do
    register 'foo', 'bar'
    add_text 'foo', 'bar', 'baz'
    visit edit_text_path(Text.first)
    fill_in 'text_title', with: 'new_title!'
    fill_in 'text_description', with: 'new_desc!'
    fill_in 'text_content', with: 'new_cont!'
    click_button 'Update'
    page.should have_content 'new_title!'
    page.should have_content 'new_desc!'
    #page.should have_content 'new_cont!'
    Text.first.content.should == 'new_cont!'
  end
  it 'updates words when edited' do
    text = Text.create content: 'aa bb cc'
    Text.first.update_attributes(content: 'aa bb').should be true
    Text.first.update_attributes(content: 'cc dd').should be true
    Text.first.words.count.should == 2
    #text.reload
    #text.reload
    #text.attributes = {content: 'aa bb'}
    #text.attributes = {content: 'cc dd'}
    #text.words.count.should == 2
    #Word.count.should == 4
  end
end
