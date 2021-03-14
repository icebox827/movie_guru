require 'rails_helper'

RSpec.describe User do
  name = 'name'

  it 'create successfully' do
    user = User.create(name: name)
    expect(user).to be_valid
  end

  it 'create not successful' do
    user = User.create
    expect(user).to_not be_valid
  end
end
