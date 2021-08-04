require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_one(:favourite) }
  it { should validate_presence_of(:username) }
end