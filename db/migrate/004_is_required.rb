class IsRequired < ActiveRecord::Migration

  def self.up
		add_column :project_custom_lists, :is_required, :boolean
		add_column :project_custom_lists, :project_custom_value_id, :integer
	end

	def self.down
	end

end
