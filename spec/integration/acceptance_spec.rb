describe 'Dictionaries' do
  it 'works:)' do
    visit '/'
    click_link 'Add Dictionary'
    page.should have_content 'New dictionary'
  end
  it 'works:)' do
    visit '/'
    click_link 'Add Text'
    page.should have_content 'New text'
  end
  it 'works:)' do
    text = PlainText.create title: 'foo', content: 'bar for bar baz for bar for for'.encode('utf-8')
    text.save
    text.words.count.should == 3
  end
  it 'works:)' do
    dict = {'a' => ['b'], 'c' => ['d', 'e']}
    text = Dictionary.create title: 'foo', content: dict.to_yaml
    text.save
    text.words.count.should == 2
  end
  it 'works:)' do
    dict = {'a' => ['b'], 'c' => ['d', 'e', 'e', 'd', 'd', 'e']}
    text = Dictionary.create title: 'foo', content: dict.to_yaml
    text.save
    words = text.words #.to_a
    words[0].translations.count.should == 1
    words[1].translations.count.should == 2
    words[0].translations.first.content == 'b'
  end

end
