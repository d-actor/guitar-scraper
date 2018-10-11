class CreateGuitars < ActiveRecord::Migration[5.2]
  def change
    create_table :guitars do |t|
      t.string :name
      t.string :price
      t.string :stars
      t.string :image_url

      t.timestamps
    end
  end
end
