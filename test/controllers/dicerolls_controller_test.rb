require 'test_helper'

class DicerollsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @diceroll = dicerolls(:one)
  end

  test "should get index" do
    get dicerolls_url, as: :json
    assert_response :success
  end

  test "should create diceroll" do
    assert_difference('Diceroll.count') do
      post dicerolls_url, params: { diceroll: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show diceroll" do
    get diceroll_url(@diceroll), as: :json
    assert_response :success
  end

  test "should update diceroll" do
    patch diceroll_url(@diceroll), params: { diceroll: {  } }, as: :json
    assert_response 200
  end

  test "should destroy diceroll" do
    assert_difference('Diceroll.count', -1) do
      delete diceroll_url(@diceroll), as: :json
    end

    assert_response 204
  end
end
