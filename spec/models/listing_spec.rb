describe Listing do

  listing = Listing.new(:name => 'hideout',
                        :description => 'friendly', :price => 5,
                        :available_to => '2017, 01, 01',
                        :available_from => '2017, 02, 01')

  it 'has available_to and available_from properties' do
    expect(listing).to have_attributes(:available_to => '2017, 01, 01',
                                       :available_from => '2017, 02, 01')
  end

end
