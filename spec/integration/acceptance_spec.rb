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
    text.words.count.should == 3
  end
  it 'works:)' do
    dict = {'a' => ['b'], 'c' => ['d', 'e']}
    text = Dictionary.create title: 'foo', content: dict.to_yaml
    text.words.count.should == 2
  end
  it 'works:)' do
    dict = {'a' => ['b'], 'c' => ['d', 'e', 'e', 'd', 'd', 'e']}
    text = Dictionary.create title: 'foo', content: dict.to_yaml
    words = text.words #.to_a
    words[0].translations.count.should == 1
    words[1].translations.count.should == 2
    words[0].translations.first.content == 'b'
  end
  it 'works:)' do
    a = PlainText.create content: 'a b c a b c a a b b c c'
    a.words.count.should == 3
  end
  it 'works:)' do
    a = Dictionary.create content: "---\na: b\nc: [d, e]"
    a.words.count.should == 2
    a.words.map{|w| w.translations.count }.sum.should == 3 
  end
end
describe Word do
  it 'should store content in lower case' do
    w = Word.create content: 'Big'
    w.content.should == 'big'
  end
  it 'should provide similar words' do
    dict = {'a'=>'1', 'aa'=>11, 'b'=>2, 'bb'=>22, 'ab'=>12, 'ba'=>21}
    Dictionary.create content: dict.to_yaml
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
end
