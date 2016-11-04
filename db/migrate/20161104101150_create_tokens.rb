class CreateTokens < ActiveRecord::Migration[5.0]
  def change
    drop_table :tokens

    create_table :tokens do |t|
      t.string :token
      t.belongs_to :user, index:true
      t.datetime :expires_at
      t.timestamps
    end
  end
end
