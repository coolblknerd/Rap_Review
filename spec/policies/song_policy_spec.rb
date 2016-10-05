require 'rails_helper'

describe SongPolicy do

  subject { SongPolicy }

  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:guest_user) { FactoryGirl.build_stubbed :user }
  let(:current_user) { FactoryGirl.build_stubbed :user }
  let(:member) { FactoryGirl.create(:user, :member)}

  permissions :index? do

    it 'allows guest to access song index' do
      expect(subject).to permit current_user, guest_user
    end

    it 'allows member to access song index' do
      expect(subject).to permit member
    end

    it 'allows admin to access song index' do
      expect(subject).to permit admin
    end

  end

  permissions :show? do

    it 'allows guest to access song show' do
      expect(subject).to permit current_user, guest_user
    end

    it 'allows member to access song show' do
      expect(subject).to permit member
    end

    it 'allows admin to access song show' do
      expect(subject).to permit admin
    end

  end

  permissions :create? do

    it 'allows admin to create a song' do
      expect(subject).to permit admin
    end

    it 'denies member to create a song' do
      expect(subject).to_not permit member
    end
  end

  permissions :update? do

    it 'allows admin to update a song' do
      expect(subject).to permit admin
    end

    it 'denies member to update a song' do
      expect(subject).to_not permit member
    end

  end

  permissions :destroy? do

    it 'allows admin to destroy a song' do
      expect(subject).to permit admin
    end

    it 'denies member to update a song' do
      expect(subject).to_not permit member
    end
  end

  permissions :upvote? do
    it 'allows member to add a like' do
      expect(subject).to permit member
    end
  end

  permissions :downvote? do
    it 'allows member to add a dislike' do
      expect(subject).to permit member
    end
  end

end
