class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.string :syoukai, null: false
      t.integer :money, null: false
      t.string :address, null: false
      t.references :user, foreign_key: true,  null: false

      t.timestamps
    end
  end
end
