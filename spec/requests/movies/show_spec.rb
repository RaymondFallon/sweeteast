# frozen_string_literal: true

require 'rails_helper'

describe 'GET /movies/:id' do
  let!(:movie) { create(:movie, title: 'Climax') }
  let(:path) { movie_path(movie) }

  it 'shows the movie page' do
    get path
    expect(response.body).to include 'Climax'
  end

  it 'displays upcoming showtimes' do
    showtime = create(:showtime, :upcoming, movie: movie)
    get path
    expect(response.body).to include(CGI.escapeHTML(showtime.theater.name))
  end
end
