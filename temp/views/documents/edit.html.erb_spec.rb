require 'spec_helper'

describe "documents/edit" do
  before(:each) do
    @document = assign(:document, stub_model(Document,
      :user_id => 1,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit document form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => documents_path(@document), :method => "post" do
      assert_select "input#document_user_id", :name => "document[user_id]"
      assert_select "input#document_title", :name => "document[title]"
      assert_select "textarea#document_description", :name => "document[description]"
    end
  end
end
