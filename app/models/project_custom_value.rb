class ProjectCustomValue < ActiveRecord::Base
	belongs_to :project_custom_list

	def custom_field
		project_custom_list
	end

	def to_s
		value
	end

end
