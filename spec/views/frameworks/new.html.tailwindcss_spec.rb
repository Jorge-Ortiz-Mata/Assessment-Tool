require 'rails_helper'

RSpec.describe "frameworks/new", type: :view do
  before(:each) do
    assign(:framework, Framework.new(
      name: "MyString",
      description: "MyString"
    ))
  end

  it "renders new framework form" do
    render

    assert_select "form[action=?][method=?]", frameworks_path, "post" do

      assert_select "input[name=?]", "framework[name]"

      assert_select "input[name=?]", "framework[description]"
    end
  end
end
