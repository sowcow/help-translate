require 'spec_helper'

describe "sentences/edit" do
  before(:each) do
    @sentence = assign(:sentence, stub_model(Sentence,
      :document_id => 1,
      :body => "MyString",
      :additional => "MyText"
    ))
  end

  it "renders the edit sentence form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sentences_path(@sentence), :method => "post" do
      assert_select "input#sentence_document_id", :name => "sentence[document_id]"
      assert_select "input#sentence_body", :name => "sentence[body]"
      assert_select "textarea#sentence_additional", :name => "sentence[additional]"
    end
  end
end
