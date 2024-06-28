# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with an email and password' do
    user = User.new(
      email: 'ray@example.com',
      password: 'password'
    )
    expect(user).to be_valid
  end
end
