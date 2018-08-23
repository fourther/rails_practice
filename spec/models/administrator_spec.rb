require 'rails_helper'

RSpec.describe Administrator, :type => :model do
  describe '#password=' do
    example "文字列を与えると60文字のハッシュがhash_passwordに入る" do
      admin = Administrator.new
      admin.password = "password"
      expect(admin.hashed_password).to be_kind_of(String)
      expect(admin.hashed_password.size).to eq(60)
    end

    example "passwordがnilならhased_passwordもnilになる" do
      admin = Administrator.new(hashed_password: 'x')
      admin.password = nil
      expect(admin.hashed_password).to be_nil
    end
  end
end
