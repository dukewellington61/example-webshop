require 'rails_helper'

RSpec.describe "line_items/new", type: :view do
  before(:each) do
    assign(:line_item, LineItem.new(
      :product => "MyString",
      :references => "MyString",
      :cart => nil
    ))
  end

  it "renders new line_item form" do
    render

    assert_select "form[action=?][method=?]", line_items_path, "post" do

      assert_select "input[name=?]", "line_item[product]"

      assert_select "input[name=?]", "line_item[references]"

      assert_select "input[name=?]", "line_item[cart_id]"
    end
  end
end
