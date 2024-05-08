# frozen_string_literal: true

require 'rails_helper'

describe 'GET /movies/:id/edit' do
  include_context 'for resource requests'

  let!(:movie) { create(:movie) }
  let(:path) { edit_movie_path(movie) }

  it 'redirects to Sign In' do
    get path
    expect(response).to redirect_to(new_user_session_path)
  end

  context 'when signed in' do
    before { sign_in(create(:user)) }

    it 'displays the Edit Movie form' do
      get path
      expect(response.body).to include 'Edit Movie'
    end
  end
end
