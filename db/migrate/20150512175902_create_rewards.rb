class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :title
      t.string :description
      t.integer :amount
      t.integer :backer_limit
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
