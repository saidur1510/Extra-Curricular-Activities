require 'rails_helper'

RSpec.describe Extracurricularactivity, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:department) }
  it { should validate_presence_of(:interest) }
end
