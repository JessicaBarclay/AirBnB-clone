feature 'listing management' do
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
