class Service < ActiveRecord::Base
	has_many :servicepics, dependent: :destroy
	accepts_nested_attributes_for :servicepics, allow_destroy: true

	validates :title, :desctitle, :description, presence: true

end
