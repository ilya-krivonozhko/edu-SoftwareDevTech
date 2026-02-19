class StudentsClient
  BASE_URL = ENV.fetch("STUDENTS_SERVICE_URL", "http://students-service:3000")

  def self.all
    response = Faraday.get("#{BASE_URL}/students")
    JSON.parse(response.body)
  end
end