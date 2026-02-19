class ReportsController < ApplicationController
  def attendance
    students = StudentsClient.all

    report = students.map do |student|
      attendances = AttendanceClient.by_student(student["id"])

      {
        student: student,
        total_classes: attendances.size,
        present: attendances.count { |a| a["status"] == "present" },
        absent: attendances.count { |a| a["status"] == "absent" }
      }
    end

    render json: report
  end
end
