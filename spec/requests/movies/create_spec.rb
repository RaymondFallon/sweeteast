# frozen_string_literal: true

require 'rails_helper'

describe 'POST /movies' do
  include_context 'for resource requests'

  let(:path) { new_movie_path }
  let(:params) { { movie: { title: 'Challengers' } } }

  it 'redirects to Sign In' do
    post movies_path, params: params
    expect(response).to redirect_to(new_user_session_path)
  end

  context 'when signed in' do
    before { sign_in(create(:user)) }

    it 'creates a movie' do
      expect{post movies_path, params: params}.to change(Movie, :count).by(1)
      expect(response).to redirect_to(movie_path(Movie.last))
    end
  end
end
