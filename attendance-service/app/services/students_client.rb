class StudentsClient
  BASE_URL = ENV.fetch("STUDENTS_SERVICE_URL", "http://students-service:3000")

  def self.exists?(student_id)
    response = Faraday.get("#{BASE_URL}/students")
    students = JSON.parse(response.body)
    students.any? { |s| s["id"] == student_id }
  rescue
    false
  end
end
