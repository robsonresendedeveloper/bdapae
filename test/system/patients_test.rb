require "application_system_test_case"

class PatientsTest < ApplicationSystemTestCase
  setup do
    @patient = patients(:one)
  end

  test "visiting the index" do
    visit patients_url
    assert_selector "h1", text: "Patients"
  end

  test "creating a Patient" do
    visit patients_url
    click_on "New Patient"

    fill_in "Born", with: @patient.born
    fill_in "Entry date", with: @patient.entry_date
    fill_in "Exit date", with: @patient.exit_date
    fill_in "Father name", with: @patient.father_name
    fill_in "Infos", with: @patient.infos
    fill_in "Mother name", with: @patient.mother_name
    fill_in "Name", with: @patient.name
    fill_in "Sex", with: @patient.sex
    click_on "Create Patient"

    assert_text "Patient was successfully created"
    click_on "Back"
  end

  test "updating a Patient" do
    visit patients_url
    click_on "Edit", match: :first

    fill_in "Born", with: @patient.born
    fill_in "Entry date", with: @patient.entry_date
    fill_in "Exit date", with: @patient.exit_date
    fill_in "Father name", with: @patient.father_name
    fill_in "Infos", with: @patient.infos
    fill_in "Mother name", with: @patient.mother_name
    fill_in "Name", with: @patient.name
    fill_in "Sex", with: @patient.sex
    click_on "Update Patient"

    assert_text "Patient was successfully updated"
    click_on "Back"
  end

  test "destroying a Patient" do
    visit patients_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Patient was successfully destroyed"
  end
end
