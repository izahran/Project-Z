class Team < ApplicationRecord
    # we want projects within a team to be destroyed if a team is
    has_many :projects, dependent: :destroy

    # teams can have many users
    has_many :users

    # To create a team I need nested forms in which I can invite users. This is what allows us to do such a thing.
    accepts_nested_attributes_for :users, allow_destroy: true
    include PublicActivity::Model
	tracked owner: Proc.new { |controller, model| controller.current_user }
end
