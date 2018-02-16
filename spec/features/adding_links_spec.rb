feature "adding links" do
  scenario "User can add links" do
    visit '/'
    fill_in "url", with: "http://www.twitter.com"
    fill_in "title", with: "twitter"
    click_button "Add link"
    expect(page).to have_content "twitter"
  end
end
