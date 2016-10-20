require 'rails_helper'

RSpec.describe User, type: :model do
  # Relations
  it { should have_many :characters }

  # Validations
  it { should validate_presence_of :email }
  it { should validate_presence_of :encrypted_password }
  it { should validate_presence_of :sign_in_count }
end
