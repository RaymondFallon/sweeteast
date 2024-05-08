# frozen_string_literal: true

require 'rails_helper'

describe 'GET /' do
  let!(:article) { create(:article, :published, title: 'Men is a Mess') }
  let!(:article) { create(:article, :published, title: 'Jam if you Can') }
  let!(:showtime) { create(:showtime, start_datetime: 2.days.from_now) }

  let(:path) { root_path }

  it 'displays a list of articles' do
    get path
    expect(response.body).to include 'Jam if you Can'
  end

  it 'displays upcoming showtimes' do
    get path
    expect(response.body).to include(CGI.escapeHTML(showtime.movie.title))
  end
end
