class CreateHabits < ActiveRecord::Migration[5.0]
  def change
    create_table :habits do |t|
      t.string :title
      t.string :type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
