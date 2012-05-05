require 'spec_helper'

describe "sentences/edit" do
  before(:each) do
    @sentence = assign(:sentence, stub_model(Sentence,
      :document_id => 1
    ))
  end

  it "renders the edit sentence form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sentences_path(@sentence), :method => "post" do
      assert_select "input#sentence_document_id", :name => "sentence[document_id]"
    end
  end
end
