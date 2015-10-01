class Project < ActiveRecord::Base
	has_many :participations
	has_many :teammembers, through: :participations

	has_many :projectphotos, dependent: :destroy

	accepts_nested_attributes_for	:projectphotos, allow_destroy: true

	def next
		Project.where("id > ?", id).order("id ASC").first || Project.first
	end
end
