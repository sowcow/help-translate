require 'spec_helper'

describe "translations/show" do
  before(:each) do
    @translation = assign(:translation, stub_model(Translation,
      :sentence_id => 1,
      :user_id => 2,
      :body => "Body"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Body/)
  end
end
