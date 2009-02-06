require_dependency 'projects_helper'
module ProjectsHelperPatch

  def self.included(base) 
		base.send(:include, InstanceMethods)
    base.class_eval { alias_method_chain :project_settings_tabs, :custom_fields }
  end

	module InstanceMethods

		def project_settings_tabs_with_custom_fields
			tabs = project_settings_tabs_without_custom_fields
			tabs << {
				:name    => 'Custom Lists', 
				:action  => :manage_custom_lists, 
				:partial => 'projects/settings/custom_lists', 
				:label   => "Custom Lists"
			}
		end

	end

end

ProjectsHelper.send(:include, ProjectsHelperPatch)
