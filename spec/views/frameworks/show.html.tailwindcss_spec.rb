require 'rails_helper'

RSpec.describe "frameworks/show", type: :view do
  before(:each) do
    @framework = assign(:framework, Framework.create!(
      name: "Name",
      description: "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
  end
end
