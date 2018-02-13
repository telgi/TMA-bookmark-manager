feature "viewing links" do
  scenario "User can see links" do
    visit '/'
    click_button "Show links"
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.facebook.com"
  end
end
