class CreateActors < ActiveRecord::Migration[8.0]
  def change
    create_table :actors do |t|
      t.string :name
      t.date :date_of_birth
      t.string :nationality

      t.timestamps
    end
  end
end
