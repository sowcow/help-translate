describe 'Dictionaries' do
  it 'can be created by any one' do
    visit '/'
    click_link 'Add Dictionary'
    page.should have_content 'New dictionary'
  end
  #it '?' do
  #  dict = {'a' => ['b'], 'c' => ['d', 'e']}
  #  text = Dictionary.create title: 'foo', content: dict.to_yaml
  #  text.words.count.should == 2
  #end
  #it '...words_translations...' do
  #  dict = {'a' => ['b'], 'c' => ['d', 'e', 'e', 'd', 'd', 'e']}
  #  text = Dictionary.create title: 'foo', content: dict.to_yaml
  #  words = text.words #.to_a
  #  words[0].translations.count.should == 1
  #  words[1].translations.count.should == 2
  #  words[0].translations.first.content == 'b'
  #end
  it 'should create word list for new text' do
    text = Text.create content: 'a b c a b c a a b b c c'
    text.words.count.should == 3
  end
  #it '...words+translations...)' do
  #  a = Dictionary.create content: {'a'=>'b','c'=>['d','e']}.to_yaml  #"---\na: b\nc: [d, e]"
  #  a.words.count.should == 2
  #  a.words.map{|w| w.translations.count }.sum.should == 3 
  #end
end
describe Text do
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
    #Word.delete_all
    text = Text.create content: 'aa bb cc'
    text.update_attributes content: 'aa bb'
    text.update_attributes content: 'cc dd'
    #text.save
    text.words.count.should == 2    
    Word.count.should == 4
  end
end

describe Word do
  it 'should store content in lower case' do
    w = Word.create content: 'Big'
    w.content.should == 'big'
  end
  it 'should provide similar words' do
    #dict = {'a'=>'1', 'aa'=>11, 'b'=>2, 'bb'=>22, 'ab'=>12, 'ba'=>21}
    text = 'a aa b bb ab ba'
    #Dictionary.create content: dict.to_yaml
    Text.create content: text
    w = Word.create content: 'ac'
    sim = w.similar 3
    sim.size.should == 3
    sim.map(&:content).sort.should == %w[ a aa ab ].sort
  end
  it 'should provide translations for similar words' do
    dict = {'a'=>1, 'aa'=>11, 'b'=>2, 'bb'=>22, 'ab'=>12, 'ba'=>21}
    Dictionary.create content: dict.to_yaml
    w = Word.create content: 'ac'
    sim = w.similar 3
    sim.map{|w| w.translations.first.content }.sort.should == %w[1 11 12]
  end
  it 'can''t be a numer' do
    expect{ Word.create!(content: '12') }.should raise_error
  end
end
