# frozen_string_literal: true

require 'rails_helper'

describe 'GET /articles' do
  let!(:article) { create(:article, :published, title: 'Men is a Mess') }
  let!(:article) { create(:article, :published, title: 'Jam if you Can') }
  let(:path) { articles_path }

  it 'displays a list of articles' do
    get path
    expect(response.body).to include 'Jam if you Can'
  end
end
