class User < ActiveRecord::Base
	require "csv"
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
    	csv << ["name", "email", "telephone_number", "website"]
    	all.each do |user|
      	csv << user.attributes.values_at(*["name", "email", "telephone_number", "website"])
    	end
 		end
	end

	def self.import(file)
		 @arr = []
		 	begin
		 		raise "File type must be csv" if File.extname(file.original_filename) != ".csv"
		 		CSV.foreach(file.path, headers: true) do |row|
			 		if row.to_hash["email"].present? && row.to_hash["name"].present?
			 			row.to_hash["email"].match('^.+@.+$').present? ? create_data(row.to_hash, @arr) : @arr << "#{row.to_hash["email"]} is invalid Email" 
			 		else
			 			@arr << "Insert the name or email for entry"
			 		end
			 	end
    	rescue Exception => e 
    		@arr << e.message
    	end
    	return @arr
  	
	end


	def self.create_data(data,arr)
    unless User.find_by_email(data["email"]).present? 
			User.create! data
		else
			arr << "#{data["email"]} is email has alreay taken"
		end
		return arr
	end

end
