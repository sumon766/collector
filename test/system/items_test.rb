require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:one)
  end

  test "visiting the index" do
    visit items_url
    assert_selector "h1", text: "Items"
  end

  test "should create item" do
    visit items_url
    click_on "New item"

    fill_in "Collection", with: @item.collection_id
    fill_in "Custom date1 value", with: @item.custom_date1_value
    fill_in "Custom date2 value", with: @item.custom_date2_value
    fill_in "Custom date3 value", with: @item.custom_date3_value
    fill_in "Custom int1 value", with: @item.custom_int1_value
    fill_in "Custom int2 value", with: @item.custom_int2_value
    fill_in "Custom int3 value", with: @item.custom_int3_value
    fill_in "Custom string1 value", with: @item.custom_string1_value
    fill_in "Custom string2 value", with: @item.custom_string2_value
    fill_in "Custom string3 value", with: @item.custom_string3_value
    fill_in "Custom txt1 value", with: @item.custom_txt1_value
    fill_in "Custom txt2 value", with: @item.custom_txt2_value
    fill_in "Custom txt3 value", with: @item.custom_txt3_value
    fill_in "Name", with: @item.name
    fill_in "Tags", with: @item.tags
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "should update Item" do
    visit item_url(@item)
    click_on "Edit this item", match: :first

    fill_in "Collection", with: @item.collection_id
    fill_in "Custom date1 value", with: @item.custom_date1_value
    fill_in "Custom date2 value", with: @item.custom_date2_value
    fill_in "Custom date3 value", with: @item.custom_date3_value
    fill_in "Custom int1 value", with: @item.custom_int1_value
    fill_in "Custom int2 value", with: @item.custom_int2_value
    fill_in "Custom int3 value", with: @item.custom_int3_value
    fill_in "Custom string1 value", with: @item.custom_string1_value
    fill_in "Custom string2 value", with: @item.custom_string2_value
    fill_in "Custom string3 value", with: @item.custom_string3_value
    fill_in "Custom txt1 value", with: @item.custom_txt1_value
    fill_in "Custom txt2 value", with: @item.custom_txt2_value
    fill_in "Custom txt3 value", with: @item.custom_txt3_value
    fill_in "Name", with: @item.name
    fill_in "Tags", with: @item.tags
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "should destroy Item" do
    visit item_url(@item)
    click_on "Destroy this item", match: :first

    assert_text "Item was successfully destroyed"
  end
end
