require "test_helper"
class ProductTest < ActiveSupport::TestCase
    set_fixture_class my_products: Product
    fixtures :my_products
    # test "the truth" do
    #   assert true
    # end
end
