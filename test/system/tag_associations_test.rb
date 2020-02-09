require "application_system_test_case"

class TagAssociationsTest < ApplicationSystemTestCase
  setup do
    @tag_association = tag_associations(:one)
  end

  test "visiting the index" do
    visit tag_associations_url
    assert_selector "h1", text: "Tag Associations"
  end

  test "creating a Tag association" do
    visit tag_associations_url
    click_on "New Tag Association"

    fill_in "Tag", with: @tag_association.tag_id
    fill_in "Task", with: @tag_association.task_id
    click_on "Create Tag association"

    assert_text "Tag association was successfully created"
    click_on "Back"
  end

  test "updating a Tag association" do
    visit tag_associations_url
    click_on "Edit", match: :first

    fill_in "Tag", with: @tag_association.tag_id
    fill_in "Task", with: @tag_association.task_id
    click_on "Update Tag association"

    assert_text "Tag association was successfully updated"
    click_on "Back"
  end

  test "destroying a Tag association" do
    visit tag_associations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tag association was successfully destroyed"
  end
end
