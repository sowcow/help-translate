require 'spec_helper'

describe "traslations/edit" do
  before(:each) do
    @traslation = assign(:traslation, stub_model(Traslation,
      :sentence_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit traslation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => traslations_path(@traslation), :method => "post" do
      assert_select "input#traslation_sentence_id", :name => "traslation[sentence_id]"
      assert_select "input#traslation_user_id", :name => "traslation[user_id]"
    end
  end
end
