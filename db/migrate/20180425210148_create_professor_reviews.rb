class CreateProfessorReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :professor_reviews do |t|
      t.text :content
      t.references :professor, foreign_key: true

      t.timestamps
    end
  end
end
