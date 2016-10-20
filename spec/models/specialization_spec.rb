require 'rails_helper'

RSpec.describe Specialization, type: :model do
  # Relations
  it { should belong_to :klass }

  # Validations
  it { should validate_presence_of :name }
end
