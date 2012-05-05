require 'spec_helper'

describe "sentences/new" do
  before(:each) do
    assign(:sentence, stub_model(Sentence,
      :document_id => 1,
      :body => "MyString",
      :additional => "MyText"
    ).as_new_record)
  end

  it "renders new sentence form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sentences_path, :method => "post" do
      assert_select "input#sentence_document_id", :name => "sentence[document_id]"
      assert_select "input#sentence_body", :name => "sentence[body]"
      assert_select "textarea#sentence_additional", :name => "sentence[additional]"
    end
  end
end
