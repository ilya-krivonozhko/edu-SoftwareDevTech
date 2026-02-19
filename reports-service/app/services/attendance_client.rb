class AttendanceClient
  BASE_URL = ENV.fetch("ATTENDANCE_SERVICE_URL", "http://attendance-service:3000")

  def self.by_student(student_id)
    response = Faraday.get(
      "#{BASE_URL}/attendances/by_student",
      { student_id: student_id }
    )
    JSON.parse(response.body)
  end
end
