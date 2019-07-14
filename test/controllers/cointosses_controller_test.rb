require 'test_helper'

class CointossesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cointoss = cointosses(:one)
  end

  test "should get index" do
    get cointosses_url, as: :json
    assert_response :success
  end

  test "should create cointoss" do
    assert_difference('Cointoss.count') do
      post cointosses_url, params: { cointoss: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show cointoss" do
    get cointoss_url(@cointoss), as: :json
    assert_response :success
  end

  test "should update cointoss" do
    patch cointoss_url(@cointoss), params: { cointoss: {  } }, as: :json
    assert_response 200
  end

  test "should destroy cointoss" do
    assert_difference('Cointoss.count', -1) do
      delete cointoss_url(@cointoss), as: :json
    end

    assert_response 204
  end
end
