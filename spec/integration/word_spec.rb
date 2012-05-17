describe Word do
  describe 'similar words' do
    it 'have translations' do
      Dictionary.create content: {'aaaa'=>'1','aaab'=>'2', 'aaac'=>'3', 'aaad'=>'4'}.to_yaml
      Word.create %w[aaaab aaaac].map{|w| {content: w}}
      Word.where(content:'aaaa').first.similars.map(&:content).sort.should == ['aaab', 'aaac', 'aaad']
#should include 'bb'
#      Word.where(content:'aa').first.similars.should include 'cc'
    end
  end
  it 'should store content in lower case' do
    w = Word.create content: 'Big'
    w.content.should == 'big'
  end
  it 'should provide similar words' do
    dict = {'a'=>'1', 'aa'=>11, 'b'=>2, 'bb'=>22, 'ab'=>12, 'ba'=>21}
    #text = 'a aa b bb ab ba'
    Dictionary.create content: dict.to_yaml
    #Text.create content: text
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
