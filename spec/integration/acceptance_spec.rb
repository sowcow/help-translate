describe Dictionary do
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
  #it '...words+translations...)' do
  #  a = Dictionary.create content: {'a'=>'b','c'=>['d','e']}.to_yaml  #"---\na: b\nc: [d, e]"
  #  a.words.count.should == 2
  #  a.words.map{|w| w.translations.count }.sum.should == 3 
  #end
end
