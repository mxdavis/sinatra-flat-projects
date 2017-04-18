require_relative '../spec_helper'

describe Task do
  it 'is valid with a name' do
    task = build(:task)

    expect(task).to be_valid
  end

  it 'is invalid without a name' do
    task = build(:task, name: nil)

    expect(task).to_not be_valid
  end

  describe 'associations' do
    it 'belongs to a project' do
      project = create(:project)
      task = create(:task)
      task.project = project

      expect(task.project.title).to eq('Sinatra Project')
    end
  end
end
