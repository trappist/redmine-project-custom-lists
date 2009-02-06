require_dependency 'issue'
module IssueModelPatch

  def self.included(base) 
		base.extend(ClassMethods)
		base.send(:include, InstanceMethods)
		base.class_eval do
			unloadable
			has_and_belongs_to_many :project_custom_values
			has_many :project_custom_lists, :through => :project
		end
  end

	module ClassMethods; end

	module InstanceMethods; end

end

Issue.send(:include, IssueModelPatch)
