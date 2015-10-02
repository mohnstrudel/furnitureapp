class Front::TeammembersController < ApplicationController
	def index
		@teammembers = Teammember.all[2..-1]
		@firstMembers = Teammember.all[0..1]

		@splittedText = Setting.first.about.split('.')
	  	if @splittedText.length > 4
	  		amount = @splittedText.length/4
	  	else
	  		amount = 1
	  	end
	  	@splittedText = @splittedText.in_groups_of(amount, false)
	end
end
