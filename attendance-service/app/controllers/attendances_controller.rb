class AttendancesController < ApplicationController
  def index
    render json: Attendance.all
  end

  def create
    attendance = Attendance.create!(attendance_params)
    render json: attendance, status: :created
  end

  def by_student
    render json: Attendance.where(student_id: params[:student_id])
  end

  private

  def attendance_params
    params.require(:attendance).permit(:student_id, :date, :status)
  end
end
