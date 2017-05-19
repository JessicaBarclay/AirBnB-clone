feature 'listing management' do
  scenario 'User is redirected to sign up, if listing a space while logged out' do
    expect{ list_a_space }.not_to change(Listing, :count)
    expect(page).to have_content('You must be logged in to post listing')
    expect(current_path).to eq '/'
  end

  scenario 'User can post a listing' do
    sign_up
    expect { list_a_space }.to change(Listing, :count).by 1
    expect(current_path).to eq '/listing'
  end

  scenario 'User can post multiple listings' do
    sign_up
    expect { list_a_space; list_a_space }.to change(Listing, :count).by 2
  end

  scenario 'listing belongs to a user' do
    sign_up
    list_a_space
    listing = Listing.first
    expect(listing.user.username).to eq "pitythefool"
  end

end
