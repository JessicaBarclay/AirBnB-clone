feature 'viewing listings page' do
  scenario 'listing appears on page' do
    list_a_space
    expect(page.status_code).to eq 200

    within 'ul#listings' do
      expect(page).to have_content 'Listing Name: hideout'
      expect(page).to have_content 'Description: good for making plans, if you can find it'
      expect(page).to have_content 'Price: 999999'
    end
  end
  scenario 'can click on a listing to view it' do
    list_a_space
    click_link 'View Listing'
    expect(current_path).to eq '/listing/hideout'
  end
end
