require 'rails_helper'

RSpec.describe "criteria/show", type: :view do
  before(:each) do
    @criterium = assign(:criterium, Criterium.create!(
      text: "Text",
      answer_type: 2,
      framework: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Text/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
