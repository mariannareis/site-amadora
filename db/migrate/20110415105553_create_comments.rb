class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.string :site
      t.text :comment
      t.boolean :approved
      t.references :text

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end

