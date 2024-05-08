# frozen_string_literal: true

require 'rails_helper'

describe 'GET /about' do
  let(:path) { about_path }

  it 'displays the About page' do
    get path
    expect(response.body).to include 'Frank Falisi & Ray Fallon'
  end
end
