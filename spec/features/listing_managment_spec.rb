feature 'listing management' do
  scenario 'User can post a listing' do
    expect { list_a_space }.to change(Listings, :count).by 1
  end
end
