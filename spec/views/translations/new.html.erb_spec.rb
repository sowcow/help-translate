require 'spec_helper'

describe "translations/new" do
  before(:each) do
    assign(:translation, stub_model(Translation,
      :sentence_id => 1,
      :user_id => 1,
      :body => "MyString"
    ).as_new_record)
  end

  it "renders new translation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => translations_path, :method => "post" do
      assert_select "input#translation_sentence_id", :name => "translation[sentence_id]"
      assert_select "input#translation_user_id", :name => "translation[user_id]"
      assert_select "input#translation_body", :name => "translation[body]"
    end
  end
end
