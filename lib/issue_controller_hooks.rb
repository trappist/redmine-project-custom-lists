class IssueControllerHooks < Redmine::Hook::Listener
	def controller_issues_edit_before_save(context={})
		customs = context[:params][:project_custom_lists]
		context[:issue].project_custom_values = ProjectCustomValue.find(customs.values)
	end
	alias_method :controller_issues_new_after_save, :controller_issues_edit_before_save
end
