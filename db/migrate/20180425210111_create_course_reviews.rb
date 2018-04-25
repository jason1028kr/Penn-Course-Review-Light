class CreateCourseReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :course_reviews do |t|
      t.text :content
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
