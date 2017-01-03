require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validations" do
    it { should validate_presence_of(:first_name)}
    it { should validate_presence_of(:last_name)}
    it { should validate_presence_of(:street_number)}
    it { should validate_presence_of(:city)}
    it { should validate_presence_of(:state)}
    it { should validate_presence_of(:zip_code)}
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:picture)}
    it { should validate_presence_of(:phone)}
    it { should validate_presence_of(:password)}
    it { should validate_presence_of(:category_id)}
    it { should validate_confirmation_of(:password)}
  end

  context "Uniqueness" do
    it { should validate_uniqueness_of(:email)}
  end

  context "Relationships" do
    it { should belong_to(:category)}
  end
end
