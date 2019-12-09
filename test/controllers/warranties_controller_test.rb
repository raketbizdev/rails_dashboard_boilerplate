require 'test_helper'

class WarrantiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @warranty = warranties(:one)
  end

  test "should get index" do
    get warranties_url
    assert_response :success
  end

  test "should get new" do
    get new_warranty_url
    assert_response :success
  end

  test "should create warranty" do
    assert_difference('Warranty.count') do
      post warranties_url, params: { warranty: { client_id: @warranty.client_id, product_name: @warranty.product_name, product_serial_number: @warranty.product_serial_number } }
    end

    assert_redirected_to warranty_url(Warranty.last)
  end

  test "should show warranty" do
    get warranty_url(@warranty)
    assert_response :success
  end

  test "should get edit" do
    get edit_warranty_url(@warranty)
    assert_response :success
  end

  test "should update warranty" do
    patch warranty_url(@warranty), params: { warranty: { client_id: @warranty.client_id, product_name: @warranty.product_name, product_serial_number: @warranty.product_serial_number } }
    assert_redirected_to warranty_url(@warranty)
  end

  test "should destroy warranty" do
    assert_difference('Warranty.count', -1) do
      delete warranty_url(@warranty)
    end

    assert_redirected_to warranties_url
  end
end
