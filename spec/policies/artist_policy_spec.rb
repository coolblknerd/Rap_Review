require 'rails_helper'

describe ArtistPolicy do

  subject { ArtistPolicy }

    let(:user) { FactoryGirl.create(:user, :admin) }
    let(:guest_user) { FactoryGirl.build_stubbed :user }
    let(:current_user) { FactoryGirl.build_stubbed :user }
    let(:member) { FactoryGirl.build_stubbed :user}

    permissions :index? do

      it "allows guest to view artist index" do
        expect(subject).to permit current_user, guest_user
      end

      it "allows members to view artist index" do
        expect(subject).to permit current_user, member
      end

      it "allows admins to view artist index" do
        expect(subject).to permit user
      end

    end

    permissions :show? do

      it "allows guest to view artist show page" do
        expect(subject).to permit current_user, guest_user
      end

    end

    permissions :create? do

      it "denies guest access to create a artist" do
        expect(subject).to_not permit guest_user
      end

      it "denies member access to create a artist" do
        expect(subject).to_not permit current_user, member
      end

      it "allows admin access to create a artist" do
        expect(subject).to permit user
      end

    end

    permissions :update? do

      it "denies guest access to update a artist" do
        expect(subject).to_not permit guest_user
      end

      it "denies member access to update a artist" do
        expect(subject).to_not permit current_user, member
      end

      it "allows admin access to update a artist" do
        expect(subject).to permit user
      end

    end

    permissions :destroy? do

      it "denies guest access to delete a artist" do
        expect(subject).to_not permit guest_user
      end

      it "denies member access to delete a artist" do
        expect(subject).to_not permit current_user, member
      end

      it "allows admin access to delete a artist" do
        expect(subject).to permit user
      end

    end

end
