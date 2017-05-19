feature 'Requests' do
  scenario 'User can request a listing' do
    expect {make_a_request}.to change(Request, :count).by 1
  end

  scenario 'User is redirected to sign up, if requesting a space while logged out' do
    expect{ make_a_request_while_logged_out }.not_to change(Request, :count)
    expect(page).to have_content('You must be logged in to make a request')
    expect(current_path).to eq '/'
  end

  scenario 'Requests belong to a user' do
    make_a_request
    request = Request.first
    expect(request.user.username).to eq "pitythefool"
  end

  scenario 'Requests belong to a listing' do
    make_a_request
    request = Request.first
    expect(request.listing.name).to eq "hideout"
    expect(request.listing.user.username).to eq "pitythefool"
  end

  scenario 'User is presented with listing request' do
    make_a_request
    expect(page.status_code).to eq 200
    expect(page).to have_content 'pitythefool has requested to stay at the hideout'
    expect(page).to have_content 'requesting dates from 2018-01-01 to 2018-01-02'
    expect(page).to have_content 'pitythefool has yet to confirm'
  end
end
