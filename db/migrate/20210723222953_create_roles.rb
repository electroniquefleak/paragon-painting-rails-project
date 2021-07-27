class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.belongs_to :user
      t.belongs_to :project
      t.string :title

      t.timestamps
    end
  end
end
