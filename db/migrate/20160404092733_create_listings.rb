class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
    	t.string :city
    	t.string :hometype 
    	t.string :roomtype
    	t.integer :accommodates
    	t.date :available_from
    	t.date :available_until
    	t.decimal :price
    	t.string :currency
    	t.integer :user_id

    	t.timestamps null: false
    end
  end
end
