require 'rails_helper'

RSpec.describe MoviePaper, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:character_name)  }
  end
end
