class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price,  precision: 10, scale: 2
      t.decimal :amount,  precision: 10, scale: 2
      t.timestamp :release_date
      t.references :issue, foreign_key: true,  type: :integer
    end
  end
end
