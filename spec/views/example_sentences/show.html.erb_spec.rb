require 'spec_helper'

describe "example_sentences/show" do
  before(:each) do
    @example_sentence = assign(:example_sentence, stub_model(ExampleSentence,
      :korean => "Korean",
      :english => "English"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Korean/)
    rendered.should match(/English/)
  end
end
