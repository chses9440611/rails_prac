class Candidate < ApplicationRecord
	validates :name,presence: true, begin_with_hello: true
#	validate :name_validator

	private
	def name_validator
		unless name.starts_with? 'Hello'
			errors[:name] << "Have to start with Hello"
		end
	end
end

