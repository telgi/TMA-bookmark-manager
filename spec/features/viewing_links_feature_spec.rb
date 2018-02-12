feature "viewing links" do
  scenario "User can see links" do
    visit '/'
    expect(page).to have_link "I'm a link"
  end
end
