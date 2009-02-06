class ProjectCustomList < ActiveRecord::Base
	belongs_to :project
	has_many :project_custom_values, :order => :position
	belongs_to :project_custom_value
	named_scope :for_project, lambda { |project| { :conditions => {:project_id => project } } }
	validates_uniqueness_of :name, :scope => :project_id, :message => "The name you chose is already taken"

	def values
		project_custom_values
	end

	def possible_values
		values
	end

	def default_value
		project_custom_value
	end

	def field_format;'list';end

end
