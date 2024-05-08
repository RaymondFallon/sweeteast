# frozen_string_literal: true

require 'rails_helper'

describe 'GET /movies/new' do
  include_context 'for resource requests'

  let(:path) { new_movie_path }

  it 'redirects to Sign In' do
    get path
    expect(response).to redirect_to(new_user_session_path)
  end

  context 'when signed in' do
    before { sign_in(create(:user)) }

    it 'displays the New Movie form' do
      get path
      expect(response.body).to include 'New Movie'
    end
  end
end
