require 'rails_helper'

describe UserPolicy do

  subject { UserPolicy }

  let(:user) { FactoryGirl.create(:user, :admin) }
  let(:guest_user) { FactoryGirl.build_stubbed :user }

  permissions :index? do
    it "denies access to user index if guest" do
      subject.should_not permit(guest_user)
    end

    it "allows access to user index if admin" do
      subject.should permit(user)
    end
  end

end
