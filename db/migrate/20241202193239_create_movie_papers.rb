class CreateMoviePapers < ActiveRecord::Migration[8.0]
  def change
    create_table :movie_papers do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :actor, null: false, foreign_key: true
      t.string :character_name

      t.timestamps
    end
  end
end
