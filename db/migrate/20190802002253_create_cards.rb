class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :last_four_digits
      t.date :expiry_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
