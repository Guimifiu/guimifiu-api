require 'rails_helper'

RSpec.describe ApiUser, type: :model do
  it 'should add auth_token to ApiUser' do
    @api_user = ApiUser.new(name: 'test')
    @api_user.save!
    expect(@api_user.reload.auth_token).to be
  end
end
