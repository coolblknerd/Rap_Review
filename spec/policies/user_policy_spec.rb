require 'rails_helper'

describe UserPolicy do

  subject { UserPolicy }

  let(:user) { FactoryGirl.create(:user, :admin) }
  let(:guest_user) { FactoryGirl.build_stubbed :user }
  let(:current_user) { FactoryGirl.build_stubbed :user }

  permissions :index? do
    it "denies access to user index if guest" do
      subject.should_not permit(guest_user)
    end

    it "allows access to if admin" do
      subject.should permit(user)
    end
  end

  permissions :show? do
    it "denies access to profile if guest" do
      subject.should_not permit(current_user, guest_user)
    end

    it "allows access to if current user" do
      subject.should permit(current_user, current_user)
    end

    it "allows current user to view profile" do
      subject.should permit(user)
    end
  end

  permissions :update? do
    it "denies access to user update if not admin" do
      subject.should_not permit(current_user)
    end

    it "allows admin to update profile" do
      subject.should permit(user)
    end
  end

  permissions :destroy? do
    it "denies access to user destroy if not admin" do
      subject.should_not permit(current_user)
    end

    it "allows admin to destroy profile" do
      subject.should permit(user)
    end

    it "denies admin from destroying itself" do
      subject.should_not permit(current_user, user)
    end
  end

end
