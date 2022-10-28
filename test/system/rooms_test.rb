require "application_system_test_case"

class RoomsTest < ApplicationSystemTestCase
  setup do
    @room = rooms(:one)
  end

  test "visiting the index" do
    visit rooms_url
    assert_selector "h1", text: "Rooms"
  end

  test "creating a Room" do
    visit rooms_url
    click_on "New Room"

    fill_in "Facilities", with: @room.facilities
    fill_in "Hotel", with: @room.hotel_id
    fill_in "Img url", with: @room.img_url
    fill_in "No of bed", with: @room.no_of_bed
    fill_in "Place", with: @room.place_id
    fill_in "Price", with: @room.price
    fill_in "Room description", with: @room.room_description
    fill_in "Room no", with: @room.room_no
    fill_in "Room type", with: @room.room_type
    click_on "Create Room"

    assert_text "Room was successfully created"
    click_on "Back"
  end

  test "updating a Room" do
    visit rooms_url
    click_on "Edit", match: :first

    fill_in "Facilities", with: @room.facilities
    fill_in "Hotel", with: @room.hotel_id
    fill_in "Img url", with: @room.img_url
    fill_in "No of bed", with: @room.no_of_bed
    fill_in "Place", with: @room.place_id
    fill_in "Price", with: @room.price
    fill_in "Room description", with: @room.room_description
    fill_in "Room no", with: @room.room_no
    fill_in "Room type", with: @room.room_type
    click_on "Update Room"

    assert_text "Room was successfully updated"
    click_on "Back"
  end

  test "destroying a Room" do
    visit rooms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Room was successfully destroyed"
  end
end
