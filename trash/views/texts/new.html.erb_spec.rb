require 'spec_helper'

describe "texts/new" do
  before(:each) do
    assign(:text, stub_model(Text,
      :title => "MyString",
      :description => "MyText",
      :content => "MyText",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new text form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => texts_path, :method => "post" do
      assert_select "input#text_title", :name => "text[title]"
      assert_select "textarea#text_description", :name => "text[description]"
      assert_select "textarea#text_content", :name => "text[content]"
      assert_select "input#text_user_id", :name => "text[user_id]"
    end
  end
end
