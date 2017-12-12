class Order < ActiveRecord::Base
	has_many :order_attachments
	accepts_nested_attributes_for :order_attachments

	def parse_files()

		@headers = []
		headers_filled = false

		@csv_info = Hash.new

		@filenames.each do |file|
			info = []
			File.open(file).each do |line|
				s = line.split(':')

				unless headers_filled
					@headers.push(s[0])

					if s[0] == "Quantity"
						@headers.push("Quantity UOM")
					end
				end

				if s[1].nil?
					info.push("")
				else
					if s[0] == "Quantity"
						info.push(s[1].strip.split(" ")[0])
						info.push(s[1].strip.split(" ")[1..2].join(' '))
					else
						info.push(s[1].strip)
					end
				end
			end
			@csv_info[file] = info
			info = []
			headers_filled = true
		end
	end

	def get_files
		
		@filenames = []

		self.order_attachments.each do |attachment|
			@filenames.push(attachment.avatar.file.file)
		end
	end

	def to_csv

		get_files
		parse_files

		CSV.generate( 
				 write_headers: true,
				 headers: @headers[0...-2]
				 ) do |csv|
			@filenames.each do |file|
				csv << @csv_info[file][0...-2]
			end
		end 

	end
end
