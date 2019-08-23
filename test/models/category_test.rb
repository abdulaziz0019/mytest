require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name:"sport")
  end

   test 'category should be valiate' do
     assert @category.valid?
   end



end
