describe Listing do

  listing = Listing.new(:name => 'hideout',
                        :description => 'friendly', :price => 5,
                        :availableto => '2017, 01, 01',
                        :availablefrom => '2017, 02, 01')

  it 'has available_to and available_from properties' do
    expect(listing).to have_attributes(:availableto => '2017, 01, 01',
                                       :availablefrom => '2017, 02, 01')
  end

end
