class Candidate < ApplicationRecord
	validates :name, presence:true

	private
	def name_validator
		unless name.start_with? 'Hello'
			errors[:name] << "Have to start with Hello"
		end
	end
end
