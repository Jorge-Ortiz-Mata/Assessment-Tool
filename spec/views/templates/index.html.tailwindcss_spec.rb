require 'rails_helper'

RSpec.describe "templates/index", type: :view do
  before(:each) do
    assign(:templates, [
      Template.create!(
        name: "Name",
        description: "Description"
      ),
      Template.create!(
        name: "Name",
        description: "Description"
      )
    ])
  end

  it "renders a list of templates" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
  end
end
