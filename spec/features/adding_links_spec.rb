feature "adding links" do
  scenario "User can add links" do
    visit '/'
    fill_in("url", with: "http://www.twitter.com")
    click_button "Add link"
    expect(page).to have_content "http://www.twitter.com"
  end
end
