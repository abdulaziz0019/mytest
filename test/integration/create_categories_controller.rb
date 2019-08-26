require 'test_helper'
class CategoryControllerTest < ActionDispatch::IntegrationTest
  # ...
  def setup
          @category = Category.create(name: "John")
  end

  test "get new category form and create category" do
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
    post categories_path, params: { category: {name: "sports"}}
    follow_redirect!
    end
    assert_template 'categories/index'
    assert_match 'sport', response.body
  end
end
