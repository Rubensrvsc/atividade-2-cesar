class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.boolean :approved

      t.timestamps
    end
  end
end
