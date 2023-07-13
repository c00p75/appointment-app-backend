class CreateMotorcycles < ActiveRecord::Migration[7.0]
  def change
    create_table :motorcycles do |t|
      t.string :model
      t.text :description
      t.string :photo
      t.integer :duration
      t.decimal :finance_fee
      t.decimal :purchase_fee
      t.decimal :amount_payable
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
