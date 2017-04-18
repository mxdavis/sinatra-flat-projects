require_relative '../spec_helper'

describe Project do
  it 'is valid with a title and description' do
    project = build(:project)

    expect(project).to be_valid
  end

  it 'is invalid without a title' do
    project = build(:project, title: nil)

    expect(project).to_not be_valid
  end

  it 'is invalid without a description' do
    project = build(:project, description: nil)

    expect(project).to_not be_valid
  end

  describe 'associations' do
    before(:each) do
      @user = create(:user)
      @project = create(:project)
      @project.user = @user
      @task = create(:task)
      @task2 = create(:task)
      @project.tasks << @task
      @project.tasks << @task2
    end

    it 'belongs to a user' do
      expect(@project.user.first_name).to eq("Cernan")
    end

    it 'has many tasks' do

    end
  end
end
