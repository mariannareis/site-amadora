require 'spec_helper'

describe "texts/index.html.erb" do
  before(:each) do
    assign(:texts, [
      stub_model(Text,
        :title => "Title",
        :content => "MyText"
      ),
      stub_model(Text,
        :title => "Title",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of texts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
