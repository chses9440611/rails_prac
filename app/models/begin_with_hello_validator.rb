class BeginWithHelloValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
		unless value.starts_with? 'Hello'
			record.errors[attribute] << "Has to start with Hello"
		end
	end
end

