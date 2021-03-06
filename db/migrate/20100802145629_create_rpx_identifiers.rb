class CreateRpxIdentifiers < ActiveRecord::Migration
  def self.up
    create_table :rpx_identifiers do |t|
      t.string  :identifier, :null => false
      t.string  :provider_name
      t.integer :user_id, :null => false
      t.timestamps
    end
    add_index :rpx_identifiers, :identifier, :unique => true, :null => false
    add_index :rpx_identifiers, :user_id, :unique => false, :null => false
  end
  
  def self.down
    drop_table :rpx_identifiers
  end
end
