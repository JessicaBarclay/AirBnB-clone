feature 'Requests' do
  scenario 'User can request a listing' do
    expect {make_a_request}.to change(Request, :count).by 1
  end
end
