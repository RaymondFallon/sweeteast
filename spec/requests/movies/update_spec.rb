# frozen_string_literal: true

require 'rails_helper'

describe 'PATCH /movies/:id' do
  include_context 'for resource requests'

  let!(:movie) { create(:movie) }
  let(:path) { movie_path(movie) }
  let(:params) { { movie: { title: 'Challengers' } } }

  it 'redirects to Sign In' do
    expect { patch path, params: params}.not_to change { movie.reload.title }
    expect(response).to redirect_to(new_user_session_path)
  end

  context 'when signed in' do
    before { sign_in(create(:user)) }

    it 'updates the movie' do
      expect{ patch path, params: params }.to change { movie.reload.title }.to('Challengers')
      expect(response).to redirect_to(movie_path(movie))
    end
  end
end
