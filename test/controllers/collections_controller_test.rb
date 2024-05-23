require "test_helper"

class CollectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collection = collections(:one)
  end

  test "should get index" do
    get collections_url
    assert_response :success
  end

  test "should get new" do
    get new_collection_url
    assert_response :success
  end

  test "should create collection" do
    assert_difference("Collection.count") do
      post collections_url, params: { collection: { category: @collection.category, custom_date1_name: @collection.custom_date1_name, custom_date1_state: @collection.custom_date1_state, custom_date2_name: @collection.custom_date2_name, custom_date2_state: @collection.custom_date2_state, custom_date3_name: @collection.custom_date3_name, custom_date3_state: @collection.custom_date3_state, custom_int1_name: @collection.custom_int1_name, custom_int1_state: @collection.custom_int1_state, custom_int2_name: @collection.custom_int2_name, custom_int2_state: @collection.custom_int2_state, custom_int3_name: @collection.custom_int3_name, custom_int3_state: @collection.custom_int3_state, custom_string1_name: @collection.custom_string1_name, custom_string1_state: @collection.custom_string1_state, custom_string2_name: @collection.custom_string2_name, custom_string2_state: @collection.custom_string2_state, custom_string3_name: @collection.custom_string3_name, custom_string3_state: @collection.custom_string3_state, custom_txt1_name: @collection.custom_txt1_name, custom_txt1_state: @collection.custom_txt1_state, custom_txt2_name: @collection.custom_txt2_name, custom_txt2_state: @collection.custom_txt2_state, custom_txt3_name: @collection.custom_txt3_name, custom_txt3_state: @collection.custom_txt3_state, description: @collection.description, image_url: @collection.image_url, name: @collection.name, user_id: @collection.user_id } }
    end

    assert_redirected_to collection_url(Collection.last)
  end

  test "should show collection" do
    get collection_url(@collection)
    assert_response :success
  end

  test "should get edit" do
    get edit_collection_url(@collection)
    assert_response :success
  end

  test "should update collection" do
    patch collection_url(@collection), params: { collection: { category: @collection.category, custom_date1_name: @collection.custom_date1_name, custom_date1_state: @collection.custom_date1_state, custom_date2_name: @collection.custom_date2_name, custom_date2_state: @collection.custom_date2_state, custom_date3_name: @collection.custom_date3_name, custom_date3_state: @collection.custom_date3_state, custom_int1_name: @collection.custom_int1_name, custom_int1_state: @collection.custom_int1_state, custom_int2_name: @collection.custom_int2_name, custom_int2_state: @collection.custom_int2_state, custom_int3_name: @collection.custom_int3_name, custom_int3_state: @collection.custom_int3_state, custom_string1_name: @collection.custom_string1_name, custom_string1_state: @collection.custom_string1_state, custom_string2_name: @collection.custom_string2_name, custom_string2_state: @collection.custom_string2_state, custom_string3_name: @collection.custom_string3_name, custom_string3_state: @collection.custom_string3_state, custom_txt1_name: @collection.custom_txt1_name, custom_txt1_state: @collection.custom_txt1_state, custom_txt2_name: @collection.custom_txt2_name, custom_txt2_state: @collection.custom_txt2_state, custom_txt3_name: @collection.custom_txt3_name, custom_txt3_state: @collection.custom_txt3_state, description: @collection.description, image_url: @collection.image_url, name: @collection.name, user_id: @collection.user_id } }
    assert_redirected_to collection_url(@collection)
  end

  test "should destroy collection" do
    assert_difference("Collection.count", -1) do
      delete collection_url(@collection)
    end

    assert_redirected_to collections_url
  end
end
