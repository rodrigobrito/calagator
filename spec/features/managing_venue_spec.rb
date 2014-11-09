require 'rails_helper'

feature 'Venue Editing' do
  let(:venue) { create(:venue) }

  scenario 'A user edits an existing venue' do

    visit "/venues/#{venue.id}"
    click_on 'edit'

    find_field('Venue Name').value.should have_content "#{venue.title}"
    fill_in 'Venue Name', with: 'Space Needle'
    fill_in 'Full Address', with: '400 Broad Street, Seattle, WA 98109, US'
    # fill_in 'Latitude*', with: ??
    # fill_in 'Longitude*', with: ??
    fill_in 'Web Link', with: 'SpaceNeed.le'
    fill_in 'Email', with: 'SpaceNeedle@hotmail.com'
    fill_in 'Telephone', with: '(298)587-7825'
    check('venue_wifi')
    fill_in 'Description', with: 'Most famous pointy building in Seattle'
    fill_in 'Access notes', with: 'Just pay the exorbitant ticket price.'
    check('venue_closed')
    check('venue_force_geocoding')

    click_on 'Update Venue'
  end
end
