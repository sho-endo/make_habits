class CreateRules < ActiveRecord::Migration[5.0]
  def change
    create_table :rules do |t|
      t.string :content
      t.references :habit, foreign_key: true

      t.timestamps
    end
  end
end
