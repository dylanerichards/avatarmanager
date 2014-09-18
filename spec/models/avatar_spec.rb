require 'rails_helper'

RSpec.describe Avatar, :type => :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
end
