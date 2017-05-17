feature 'viewing listings page' do
  scenario 'listing appears on page' do
    list_a_space
    visit '/listing'
    expect(page.status_code).to eq 200

    within 'ul#listings' do
      expect(page).to have_content 'Listing Name: hideout'
      expect(page).to have_content 'Description: good for making plans, if you can find it'
      expect(page).to have_content 'Price: 999999'
    end
  end
end
