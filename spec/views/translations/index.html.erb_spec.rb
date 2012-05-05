require 'spec_helper'

describe "translations/index" do
  before(:each) do
    assign(:translations, [
      stub_model(Translation,
        :sentence_id => 1,
        :user_id => 2,
        :body => "Body"
      ),
      stub_model(Translation,
        :sentence_id => 1,
        :user_id => 2,
        :body => "Body"
      )
    ])
  end

  it "renders a list of translations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
  end
end
