require 'test_helper'

class MotorcyclesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get motorcycles_index_url
    assert_response :success
  end

  test 'should get show' do
    get motorcycles_show_url
    assert_response :success
  end

  test 'should get create' do
    get motorcycles_create_url
    assert_response :success
  end

  test 'should get delete' do
    get motorcycles_delete_url
    assert_response :success
  end
end
