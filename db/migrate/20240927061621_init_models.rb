class InitModels < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.integer :role, default: 0
      t.string :password_digest
      t.string :remember_digest
      t.string :activation_digest
      t.boolean :activated
      t.string :reset_digest
      t.datetime :activated_at
      t.datetime :reset_sent_at

      t.timestamps
    end

    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :receiver_name
      t.text :place
      t.string :phone
      t.boolean :default

      t.timestamps
    end

    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    create_table :products do |t|
      t.string :name
      t.text :desc
      t.float :price
      t.integer :stock
      t.float :rating
      t.references :category, foreign_key: true

      t.timestamps
    end

    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    create_table :cart_items do |t|
      t.references :product, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end

    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :address, foreign_key: true
      t.string :payment_method
      t.integer :status, default: 0
      t.float :total
      t.text :cancel_reason

      t.timestamps
    end

    create_table :order_items do |t|
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :quantity
      t.float :price

      t.timestamps
    end

    create_table :reviews do |t|
      t.references :product, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
