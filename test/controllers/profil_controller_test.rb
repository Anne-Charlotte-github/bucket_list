require "test_helper"

class ProfilControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get profil_index_url
    assert_response :success
  end

  test "should get new" do
    get profil_new_url
    assert_response :success
  end

  test "should get create" do
    get profil_create_url
    assert_response :success
  end

  test "should get show" do
    get profil_show_url
    assert_response :success
  end

  test "should get edit" do
    get profil_edit_url
    assert_response :success
  end

  test "should get update" do
    get profil_update_url
    assert_response :success
  end

  test "should get delete" do
    get profil_delete_url
    assert_response :success
  end
end
