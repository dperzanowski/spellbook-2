require 'rails_helper'

RSpec.describe Klass, type: :model do
  # Relations
  it { should have_many :specializations }
  it { should have_many :spells }
  it { should have_one :character }

  # Validations
  it { should validate_presence_of :name }
end
