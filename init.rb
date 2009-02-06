require 'redmine'
require 'projects_helper_patch'
require 'issue_model_patch'
require 'project_model_patch'
require 'issue_view_hooks'
require 'issue_controller_hooks'

Redmine::Plugin.register :redmine_project_custom_lists do
  name 'Per-Project Custom Lists'
  author 'Rocco Stanzione'
  description 'Adds project-specific custom list fields for issues'
  version '0.0.1'
end
