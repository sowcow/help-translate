require 'spec_helper'

describe "texts/show" do
  before(:each) do
    @text = assign(:text, stub_model(Text,
      :title => "Title",
      :description => "MyText",
      :content => "MyText",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end
