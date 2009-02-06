class FixIssueRelations < ActiveRecord::Migration

  def self.up
		drop_table :project_custom_values_issue_relations
		create_table :issues_project_custom_values, :id => false do |t|
			t.belongs_to :issue
			t.belongs_to :project_custom_value
		end
	end

	def self.down
		drop_table :issues_project_custom_values
	end

end
