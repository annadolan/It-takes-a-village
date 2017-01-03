require 'rails_helper'

RSpec.describe Category, type: :model do

  context "Validations" do
    it { should validate_presence_of(:name)}
  end

  context "Relationships" do
    it { should have_many(:users)}
  end

  context "Uniqueness" do
    it { should validate_uniqueness_of(:name)}
  end

end
