require 'spec_helper'

describe "example_sentences/edit" do
  before(:each) do
    @example_sentence = assign(:example_sentence, stub_model(ExampleSentence,
      :korean => "MyString",
      :english => "MyString"
    ))
  end

  it "renders the edit example_sentence form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => example_sentences_path(@example_sentence), :method => "post" do
      assert_select "input#example_sentence_korean", :name => "example_sentence[korean]"
      assert_select "input#example_sentence_english", :name => "example_sentence[english]"
    end
  end
end
