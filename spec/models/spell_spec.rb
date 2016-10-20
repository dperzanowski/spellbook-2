require 'rails_helper'

RSpec.describe Spell, type: :model do
  # Relations
  it { should have_many :klasses }
  it { should have_many :specializations }
  it { should have_many :characters }

  # Validations
  it { should validate_presence_of :name }
end
