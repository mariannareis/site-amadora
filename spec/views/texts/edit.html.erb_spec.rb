require 'spec_helper'

describe "texts/edit.html.erb" do
  before(:each) do
    @text = assign(:text, stub_model(Text,
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit text form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => text_path(@text), :method => "post" do
      assert_select "input#text_title", :name => "text[title]"
      assert_select "textarea#text_content", :name => "text[content]"
    end
  end
end
