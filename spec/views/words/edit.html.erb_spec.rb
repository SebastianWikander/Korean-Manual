require 'spec_helper'

describe "words/edit" do
  before(:each) do
    @word = assign(:word, stub_model(Word,
      :korean => "MyString",
      :english => "MyString"
    ))
  end

  it "renders the edit word form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => words_path(@word), :method => "post" do
      assert_select "input#word_korean", :name => "word[korean]"
      assert_select "input#word_english", :name => "word[english]"
    end
  end
end
