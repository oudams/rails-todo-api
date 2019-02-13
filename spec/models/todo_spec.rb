require 'rails_helper'

RSpec.describe Todo do
  it { should have_many(:items).dependent(:destroy) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:owner) }
end
