class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :location
      t.date :start_date
      t.date :end_date
      t.string :description
      t.integer :revenue_estimate
      t.integer :cost_estimate

      t.timestamps
    end
  end
end
