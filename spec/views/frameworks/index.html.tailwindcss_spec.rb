require 'rails_helper'

RSpec.describe "frameworks/index", type: :view do
  before(:each) do
    assign(:frameworks, [
      Framework.create!(
        name: "Name",
        description: "Description"
      ),
      Framework.create!(
        name: "Name",
        description: "Description"
      )
    ])
  end

  it "renders a list of frameworks" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
  end
end
