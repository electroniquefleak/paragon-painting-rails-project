class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.belongs_to :user
      t.belongs_to :project
      t.integer :site_manager_id

      t.timestamps
    end
  end
end
