class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :add_student, :delete_student, :add_professor, :delete_professor]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @students = Student.all
    @professors = Professor.all
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_student
    if params[:student_id].present?
      @student = Student.find(params[:student_id])
      @course.students << @student unless @course.students.include? @student
    end
    redirect_to "/courses/#{@course.id}"
  end

  def delete_student
    @student = Student.find(params[:student_id])
    @course.students.delete(@student)
    redirect_to "/courses/#{@course.id}"
  end

  def add_professor
    if params[:professor_id].present?
      @professor = Professor.find(params[:professor_id])
      @course.professors << @professor unless @course.professors.include? @professor
    end
    redirect_to "/courses/#{@course.id}"
  end

  def delete_professor
    @professor = Professor.find(params[:professor_id])
    @course.professors.delete(@professor)
    redirect_to "/courses/#{@course.id}"
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:number, :title, :description)
  end
end
