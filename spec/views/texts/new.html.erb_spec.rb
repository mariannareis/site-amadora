require 'spec_helper'

describe "texts/new.html.erb" do
  before(:each) do
    assign(:text, stub_model(Text,
      :title => "MyString",
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new text form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => texts_path, :method => "post" do
      assert_select "input#text_title", :name => "text[title]"
      assert_select "textarea#text_content", :name => "text[content]"
    end
  end
end
