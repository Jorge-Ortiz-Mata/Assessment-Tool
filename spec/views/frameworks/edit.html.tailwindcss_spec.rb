require 'rails_helper'

RSpec.describe "frameworks/edit", type: :view do
  before(:each) do
    @framework = assign(:framework, Framework.create!(
      name: "MyString",
      description: "MyString"
    ))
  end

  it "renders the edit framework form" do
    render

    assert_select "form[action=?][method=?]", framework_path(@framework), "post" do

      assert_select "input[name=?]", "framework[name]"

      assert_select "input[name=?]", "framework[description]"
    end
  end
end
