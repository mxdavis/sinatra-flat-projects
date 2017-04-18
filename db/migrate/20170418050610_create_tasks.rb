class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :status, default: 'open'
      t.integer :project_id
    end
  end
end
