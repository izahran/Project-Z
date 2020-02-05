class Project < ApplicationRecord
    # A project will always belong to a team.
    belongs_to :team
    # A project belongs to a user when created.
    belongs_to :user
    # To associated all projects to a team requires us to add a nested form for the team in mention.
    accepts_nested_attributes_for :team
	include PublicActivity::Model
	tracked owner: Proc.new { |controller, model| controller.current_user }
end
