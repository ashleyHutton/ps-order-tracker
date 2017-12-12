class CreateOrderAttachments < ActiveRecord::Migration
  def change
    create_table :order_attachments do |t|
      t.integer :order_id
      t.string :avatar

      t.timestamps null: false
    end
  end
end
