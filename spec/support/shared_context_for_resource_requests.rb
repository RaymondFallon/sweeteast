# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_context 'for resource requests' do
  def sign_in(user)
    allow_any_instance_of(ApplicationController).to receive(:authenticate_user!).and_return(true)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(ApplicationController).to receive(:user_signed_in?).and_return(true)
  end
end
