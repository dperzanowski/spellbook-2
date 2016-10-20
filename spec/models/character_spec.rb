require 'rails_helper'

RSpec.describe Character, type: :model do
  # Relations
  it { should belong_to :klass }
  it { should belong_to :user }
  it { should have_many :spells }

  # Validations
  it { should validate_presence_of :name }
end
