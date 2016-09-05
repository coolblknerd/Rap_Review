require 'rails_helper'

describe AlbumPolicy do

  subject { AlbumPolicy }

    let(:admin) { FactoryGirl.create(:user, :admin) }
    let(:guest_user) { FactoryGirl.build_stubbed :user }
    let(:current_user) { FactoryGirl.build_stubbed :user }
    let(:member) { FactoryGirl.create(:user, :member) }

    permissions :index? do
      it "allows guest to see the albums index" do
        expect(subject).to permit current_user, guest_user
      end

      it "allows admin to see the albums index" do
        expect(subject).to permit current_user, admin
      end
    end

    permissions :show? do
      it "allows guest to see the album show page" do
        expect(subject).to permit current_user, guest_user
      end
    end

    permissions :create? do
      it "denies guest to create a new album" do
        expect(subject).to_not permit current_user, guest_user
      end

      it "denies member to create a new album" do
        expect(subject).to_not permit current_user, member
      end

      it "allows admin to create a new album" do
        expect(subject).to permit admin
      end
    end

    permissions :update? do
      it "denies guest to update a album" do
        expect(subject).to_not permit current_user, guest_user
      end

      it "denies member to update a album" do
        expect(subject).to_not permit member
      end

      it "allows admin to update a album" do
        expect(subject).to permit admin
      end
    end

    permissions :destroy? do
      it "denies guest to destroy a album" do
        expect(subject).to_not permit current_user, guest_user
      end

      it "denies member to destroy a album" do
        expect(subject).to_not permit member
      end

      it "allows admin to destroy a album" do
        expect(subject).to permit admin
      end
    end

end
