class AttachToIssues < ActiveRecord::Migration

  def self.up
		create_table :project_custom_values_issue_relations do |t|
			t.belongs_to :issue
			t.belongs_to :project_custom_value
			t.timestamps
		end
	end

	def self.down
		drop_table :project_custom_values_issue_relations
	end

end
