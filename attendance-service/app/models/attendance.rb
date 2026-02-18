class Attendance < ApplicationRecord
  validates :student_id, :date, :status, presence: true
end
