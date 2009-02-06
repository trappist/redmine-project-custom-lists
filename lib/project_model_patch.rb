require_dependency 'project'
module ProjectModelPatch

  def self.included(base) 
		base.extend(ClassMethods)
		base.send(:include, InstanceMethods)
		base.class_eval do
			unloadable
			has_many :project_custom_lists
		end
  end

	module ClassMethods; end

	module InstanceMethods; end

end

Project.send(:include, ProjectModelPatch)
