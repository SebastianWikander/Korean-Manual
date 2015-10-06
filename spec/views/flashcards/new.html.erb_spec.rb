require 'spec_helper'

describe "flashcards/new" do
  before(:each) do
    assign(:flashcard, stub_model(Flashcard,
      :user => "",
      :word => "",
      :level => ""
    ).as_new_record)
  end

  it "renders new flashcard form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => flashcards_path, :method => "post" do
      assert_select "input#flashcard_user", :name => "flashcard[user]"
      assert_select "input#flashcard_word", :name => "flashcard[word]"
      assert_select "input#flashcard_level", :name => "flashcard[level]"
    end
  end
end
