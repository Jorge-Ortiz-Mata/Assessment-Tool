require 'rails_helper'

RSpec.describe "criteria/index", type: :view do
  before(:each) do
    assign(:criteria, [
      Criterium.create!(
        text: "Text",
        answer_type: 2,
        framework: nil
      ),
      Criterium.create!(
        text: "Text",
        answer_type: 2,
        framework: nil
      )
    ])
  end

  it "renders a list of criteria" do
    render
    assert_select "tr>td", text: "Text".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
