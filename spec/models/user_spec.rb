require_relative '../spec_helper'

describe User do
  it 'has a first name, last name, and email' do
    user = build(:user)

    expect(user).to be_valid
  end

  it 'is invalid without a first name' do
    user = build(:user, first_name: nil)

    expect(user).to_not be_valid
  end

  it 'is invalid without a last name' do
    user = build(:user, last_name: nil)

    expect(user).to_not be_valid
  end

  it 'is invalid without an email' do
    user = build(:user, email: nil)

    expect(user).to_not be_valid
  end

  it 'is invalid with a duplicate email address' do
    user = create(:user)
    user2 = build(:user, first_name: 'Ashley', last_name: 'Bernardo')

    expect(user2).to_not be_valid
  end

  it 'knows its full name' do
    user = build(:user)

    expect(user.full_name).to eq("Cernan Bernardo")
  end

  describe 'associations' do
    before(:each) do
      @user = create(:user)
      @project = create(:project)
      @project2 = create(:project)
      @project.tasks << create(:task)
      @project.tasks << create(:task)
      @project.tasks << create(:task)
      @user.projects << @project
      @user.projects << @project2
    end

    it 'has many projects' do
      expect(@user.projects.size).to eq(2)
    end

    it 'has many tasks through projects' do
      expect(@user.tasks.size).to eq(3)
    end
  end
end
