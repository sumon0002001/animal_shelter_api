require 'rails_helper'

RSpec.describe Cat, type: :model do
  it { should validate_presence_of(:pet_name) }
  it { should validate_presence_of(:pet_color) }
  it { should validate_presence_of(:age) }
end