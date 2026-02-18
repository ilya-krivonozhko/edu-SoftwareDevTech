class Student < ApplicationRecord
  def index
    render json: Student.all
  end

  def create
    student = Student.create!(student_params)
    render json: student, status: :created
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :group_name)
  end
end
