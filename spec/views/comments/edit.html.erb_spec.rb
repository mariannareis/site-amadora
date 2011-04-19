require 'spec_helper'

describe "comments/edit.html.erb" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :name => "MyString",
      :email => "MyString",
      :site => "MyString",
      :comment => "MyText",
      :text => nil
    ))
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comment_path(@comment), :method => "post" do
      assert_select "input#comment_name", :name => "comment[name]"
      assert_select "input#comment_email", :name => "comment[email]"
      assert_select "input#comment_site", :name => "comment[site]"
      assert_select "textarea#comment_comment", :name => "comment[comment]"
      assert_select "input#comment_text", :name => "comment[text]"
    end
  end
end
