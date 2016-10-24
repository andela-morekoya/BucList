class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :item_id
      t.boolean :done, default: false
      t.belongs_to :bucketlist, index: true

      t.timestamps
    end
  end
end
