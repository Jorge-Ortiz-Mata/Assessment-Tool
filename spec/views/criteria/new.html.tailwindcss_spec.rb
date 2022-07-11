require 'rails_helper'

RSpec.describe "criteria/new", type: :view do
  before(:each) do
    assign(:criterium, Criterium.new(
      text: "MyString",
      answer_type: 1,
      framework: nil
    ))
  end

  it "renders new criterium form" do
    render

    assert_select "form[action=?][method=?]", criteria_path, "post" do

      assert_select "input[name=?]", "criterium[text]"

      assert_select "input[name=?]", "criterium[answer_type]"

      assert_select "input[name=?]", "criterium[framework_id]"
    end
  end
end
