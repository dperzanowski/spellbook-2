require 'rails_helper'

RSpec.describe User, type: :model do
  # Relations
  it { should have_many :characters }

  # Validations
  it { should validate_presence_of :email }
end
