require 'spec_helper'

describe "words/show" do
  before(:each) do
    @word = assign(:word, stub_model(Word,
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
