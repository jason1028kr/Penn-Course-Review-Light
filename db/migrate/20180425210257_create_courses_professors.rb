class CreateCoursesProfessors < ActiveRecord::Migration[5.1]
  def change
    create_table :courses_professors do |t|
      t.references :course, foreign_key: true
      t.references :professor, foreign_key: true

      t.timestamps
    end
  end
end
