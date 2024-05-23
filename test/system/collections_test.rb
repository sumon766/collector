require "application_system_test_case"

class CollectionsTest < ApplicationSystemTestCase
  setup do
    @collection = collections(:one)
  end

  test "visiting the index" do
    visit collections_url
    assert_selector "h1", text: "Collections"
  end

  test "should create collection" do
    visit collections_url
    click_on "New collection"

    fill_in "Category", with: @collection.category
    fill_in "Custom date1 name", with: @collection.custom_date1_name
    check "Custom date1 state" if @collection.custom_date1_state
    fill_in "Custom date2 name", with: @collection.custom_date2_name
    check "Custom date2 state" if @collection.custom_date2_state
    fill_in "Custom date3 name", with: @collection.custom_date3_name
    check "Custom date3 state" if @collection.custom_date3_state
    fill_in "Custom int1 name", with: @collection.custom_int1_name
    check "Custom int1 state" if @collection.custom_int1_state
    fill_in "Custom int2 name", with: @collection.custom_int2_name
    check "Custom int2 state" if @collection.custom_int2_state
    fill_in "Custom int3 name", with: @collection.custom_int3_name
    check "Custom int3 state" if @collection.custom_int3_state
    fill_in "Custom string1 name", with: @collection.custom_string1_name
    check "Custom string1 state" if @collection.custom_string1_state
    fill_in "Custom string2 name", with: @collection.custom_string2_name
    check "Custom string2 state" if @collection.custom_string2_state
    fill_in "Custom string3 name", with: @collection.custom_string3_name
    check "Custom string3 state" if @collection.custom_string3_state
    fill_in "Custom txt1 name", with: @collection.custom_txt1_name
    check "Custom txt1 state" if @collection.custom_txt1_state
    fill_in "Custom txt2 name", with: @collection.custom_txt2_name
    check "Custom txt2 state" if @collection.custom_txt2_state
    fill_in "Custom txt3 name", with: @collection.custom_txt3_name
    check "Custom txt3 state" if @collection.custom_txt3_state
    fill_in "Description", with: @collection.description
    fill_in "Image url", with: @collection.image_url
    fill_in "Name", with: @collection.name
    fill_in "User", with: @collection.user_id
    click_on "Create Collection"

    assert_text "Collection was successfully created"
    click_on "Back"
  end

  test "should update Collection" do
    visit collection_url(@collection)
    click_on "Edit this collection", match: :first

    fill_in "Category", with: @collection.category
    fill_in "Custom date1 name", with: @collection.custom_date1_name
    check "Custom date1 state" if @collection.custom_date1_state
    fill_in "Custom date2 name", with: @collection.custom_date2_name
    check "Custom date2 state" if @collection.custom_date2_state
    fill_in "Custom date3 name", with: @collection.custom_date3_name
    check "Custom date3 state" if @collection.custom_date3_state
    fill_in "Custom int1 name", with: @collection.custom_int1_name
    check "Custom int1 state" if @collection.custom_int1_state
    fill_in "Custom int2 name", with: @collection.custom_int2_name
    check "Custom int2 state" if @collection.custom_int2_state
    fill_in "Custom int3 name", with: @collection.custom_int3_name
    check "Custom int3 state" if @collection.custom_int3_state
    fill_in "Custom string1 name", with: @collection.custom_string1_name
    check "Custom string1 state" if @collection.custom_string1_state
    fill_in "Custom string2 name", with: @collection.custom_string2_name
    check "Custom string2 state" if @collection.custom_string2_state
    fill_in "Custom string3 name", with: @collection.custom_string3_name
    check "Custom string3 state" if @collection.custom_string3_state
    fill_in "Custom txt1 name", with: @collection.custom_txt1_name
    check "Custom txt1 state" if @collection.custom_txt1_state
    fill_in "Custom txt2 name", with: @collection.custom_txt2_name
    check "Custom txt2 state" if @collection.custom_txt2_state
    fill_in "Custom txt3 name", with: @collection.custom_txt3_name
    check "Custom txt3 state" if @collection.custom_txt3_state
    fill_in "Description", with: @collection.description
    fill_in "Image url", with: @collection.image_url
    fill_in "Name", with: @collection.name
    fill_in "User", with: @collection.user_id
    click_on "Update Collection"

    assert_text "Collection was successfully updated"
    click_on "Back"
  end

  test "should destroy Collection" do
    visit collection_url(@collection)
    click_on "Destroy this collection", match: :first

    assert_text "Collection was successfully destroyed"
  end
end
