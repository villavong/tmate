class Scholarship < ApplicationRecord
  belongs_to :user

  scope :should_display, -> { joins(:user).where(users: {status: "yes", state: "mentor"}) }


end
