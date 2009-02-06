class Setup < ActiveRecord::Migration

  def self.up
		create_table :project_custom_lists do |t|
			t.belongs_to :project
			t.string :name
		end
		create_table :project_custom_values do |t|
			t.belongs_to :project_custom_list
			t.string :value
			t.string :display
			t.integer :position
		end
	end

	def self.down
		drop_table :project_custom_lists
		drop_table :project_custom_values
	end

end
