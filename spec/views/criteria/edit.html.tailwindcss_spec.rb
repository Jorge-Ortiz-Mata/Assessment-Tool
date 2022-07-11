require 'rails_helper'

RSpec.describe "criteria/edit", type: :view do
  before(:each) do
    @criterium = assign(:criterium, Criterium.create!(
      text: "MyString",
      answer_type: 1,
      framework: nil
    ))
  end

  it "renders the edit criterium form" do
    render

    assert_select "form[action=?][method=?]", criterium_path(@criterium), "post" do

      assert_select "input[name=?]", "criterium[text]"

      assert_select "input[name=?]", "criterium[answer_type]"

      assert_select "input[name=?]", "criterium[framework_id]"
    end
  end
end
