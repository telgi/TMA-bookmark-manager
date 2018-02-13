feature "adding links" do
  scenario "User can add links" do
    visit '/'
    fill_in("url", with: "www.instagram.com")
    click_button "Add link"
    expect(page).to have_content "www.instagram.com"
  end
end
