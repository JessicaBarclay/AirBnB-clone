feature 'listing management' do
  scenario 'User can post a listing' do
    sign_up
    expect { list_a_space }.to change { Listing :count }.by 1
    expect(current_path).to eq('/listings')
  end
end
