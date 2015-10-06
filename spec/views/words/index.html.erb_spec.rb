require 'spec_helper'

describe "words/index" do
  before(:each) do
    assign(:words, [
      stub_model(Word,
        :korean => "Korean",
        :english => "English"
      ),
      stub_model(Word,
        :korean => "Korean",
        :english => "English"
      )
    ])
  end

  it "renders a list of words" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Korean".to_s, :count => 2
    assert_select "tr>td", :text => "English".to_s, :count => 2
  end
end
