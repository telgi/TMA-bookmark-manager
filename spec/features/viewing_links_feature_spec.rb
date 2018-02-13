feature "viewing links" do
  scenario "User can see links" do
    visit '/'
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.facebook.com"
  end
end
