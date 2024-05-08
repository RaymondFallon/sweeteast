# frozen_string_literal: true

require 'rails_helper'

describe 'GET /movies' do
  let!(:movie) { create(:movie, title: 'Lost in Yonkers') }
  let(:path) { movies_path }

  it 'displays all movies' do
    get path
    expect(response.body).to include 'Lost in Yonkers'
  end
end
