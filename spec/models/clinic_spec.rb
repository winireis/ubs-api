require 'rails_helper'

RSpec.describe Clinic, type: :model do
  # Validations tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }
  it { should validate_presence_of(:size) }
  it { should validate_presence_of(:adaptation_for_seniors) }
  it { should validate_presence_of(:medical_equipment) }
  it { should validate_presence_of(:medicine) }
end
