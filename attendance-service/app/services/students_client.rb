class StudentsClient
  BASE_URL = ENV.fetch("STUDENTS_SERVICE_URL", "http://students-service:3000")

  def self.exists?(student_id)
    response = Faraday.get("#{BASE_URL}/students")
    students = JSON.parse(response.body)

    students.any? { |s| s["id"].to_i == student_id.to_i }
  rescue StandardError => e
    Rails.logger.error("Students service error: #{e.message}")
    false
  end
end
