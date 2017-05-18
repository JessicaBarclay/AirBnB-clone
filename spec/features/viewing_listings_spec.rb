feature 'viewing listings page' do
  scenario 'listing appears on page' do
    sign_up
    list_a_space
    expect(page.status_code).to eq 200

    within 'ul#listings' do
      expect(page).to have_content 'Listing Name: hideout'
      expect(page).to have_content 'Description: good for making plans, if you can find it'
      expect(page).to have_content 'Price: 999999'
    end
  end
  scenario 'can click on a listing to view it' do
    sign_up
    list_a_space
    click_link 'View Listing'
    expect(current_path).to eq '/listing/hideout'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'hideout'
    expect(page).to have_content 'Description: good for making plans, if you can find it'
    expect(page).to have_content 'Price: 999999'
    expect(page).to have_content 'Available from: 2018-01-01'
    expect(page).to have_content 'Available to: 2018-01-02'
  end
end
