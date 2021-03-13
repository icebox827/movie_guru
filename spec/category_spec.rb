require 'rails_helper'

RSpec.describe Category do
  priority = 1
  name = 'category'

  it 'create successfully' do
    category = Category.create(priority: priority, name: name)
    expect(category).to be_valid
  end

  it 'create not successful' do
    category = Category.create
    expect(category).to_not be_valid
  end
end
