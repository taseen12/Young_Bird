require "application_system_test_case"

class PackagesTest < ApplicationSystemTestCase
  setup do
    @package = packages(:one)
  end

  test "visiting the index" do
    visit packages_url
    assert_selector "h1", text: "Packages"
  end

  test "creating a Package" do
    visit packages_url
    click_on "New Package"

    fill_in "Facilities", with: @package.facilities
    fill_in "Hotel", with: @package.hotel_id
    fill_in "Img url", with: @package.img_url
    fill_in "Pack description", with: @package.pack_description
    fill_in "Package name", with: @package.package_name
    fill_in "Package no", with: @package.package_no
    fill_in "Place", with: @package.place_id
    fill_in "Price", with: @package.price
    fill_in "Room", with: @package.room_id
    click_on "Create Package"

    assert_text "Package was successfully created"
    click_on "Back"
  end

  test "updating a Package" do
    visit packages_url
    click_on "Edit", match: :first

    fill_in "Facilities", with: @package.facilities
    fill_in "Hotel", with: @package.hotel_id
    fill_in "Img url", with: @package.img_url
    fill_in "Pack description", with: @package.pack_description
    fill_in "Package name", with: @package.package_name
    fill_in "Package no", with: @package.package_no
    fill_in "Place", with: @package.place_id
    fill_in "Price", with: @package.price
    fill_in "Room", with: @package.room_id
    click_on "Update Package"

    assert_text "Package was successfully updated"
    click_on "Back"
  end

  test "destroying a Package" do
    visit packages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Package was successfully destroyed"
  end
end
