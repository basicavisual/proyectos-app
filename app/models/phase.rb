class Phase < ApplicationRecord
  include AASM
  belongs_to :project

  aasm :column => 'state' do
    state :started, initial: true
    state :requiring_volunteers, :building, :finished, :reopened

    event :require_volunteers do
      after do
        Rails.logger.info("Requiring volunteers")
        # TODO: send a notification to volunteers with Phase Tag
        # TODO: Log when it happened
      end
      transitions from: [:started, :building, :reopened], to: :requiring_volunteers
    end

    event :start_building do
      # TODO: send a notification to subscribed volunteers
      # TODO: Log when it happened
      Rails.logger.info("Building project")
      transitions from: :requiring_volunteers, to: :building
    end

    event :finish do
      # TODO: send a notification to subscribed volunteers
      # TODO: Log when it happened
      transitions to: :finished
    end

    event :reopen do
      # TODO: send a notification to subscribed volunteers
      # TODO: Log when it happened
      transitions from: :finished, to: :reopened
    end
  end
end
