require 'spec_helper'

describe "flashcards/index" do
  before(:each) do
    assign(:flashcards, [
      stub_model(Flashcard,
        :user => "",
        :word => "",
        :level => ""
      ),
      stub_model(Flashcard,
        :user => "",
        :word => "",
        :level => ""
      )
    ])
  end

  it "renders a list of flashcards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
