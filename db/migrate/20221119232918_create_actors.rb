class CreateActors < ActiveRecord::Migration[7.0]
  def change
    create_table :actors do |t|
      t.string :name
      t.string :email
      t.string :year

      t.timestamps
    end
  end
end
