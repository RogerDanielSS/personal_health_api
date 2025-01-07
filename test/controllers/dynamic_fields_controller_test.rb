require "test_helper"

class DynamicFieldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dynamic_field = dynamic_fields(:one)
  end

  test "should get index" do
    get dynamic_fields_url, as: :json
    assert_response :success
  end

  test "should create dynamic_field" do
    assert_difference('DynamicField.count') do
      post dynamic_fields_url, params: { dynamic_field: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show dynamic_field" do
    get dynamic_field_url(@dynamic_field), as: :json
    assert_response :success
  end

  test "should update dynamic_field" do
    patch dynamic_field_url(@dynamic_field), params: { dynamic_field: {  } }, as: :json
    assert_response 200
  end

  test "should destroy dynamic_field" do
    assert_difference('DynamicField.count', -1) do
      delete dynamic_field_url(@dynamic_field), as: :json
    end

    assert_response 204
  end
end
