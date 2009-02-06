class ProjectCustomListsController < ApplicationController
	unloadable

	def update
		project = Project.find(params[:project_custom_list][:project_id])
		customlist = ProjectCustomList.find(params[:id])
		values = []
		strings = params[:project_custom_list][:project_custom_values].split(/\n/).map(&:strip).uniq
		strings.each_with_index do |val,idx|
			values << ProjectCustomValue.create(:value => val,:position => idx)
		end
		customlist.project_custom_values = values
		render :update do |page|
			page << "$('values#{customlist.id}').value=\"#{strings.join('\n')}\""
			page["flash#{customlist.id}"].replace_html "Updated Successfully"
		end
	end

	def create
		customlist = ProjectCustomList.new(params[:project_custom_list])
		render :update do |page|
			if customlist.save
				page.insert_html :bottom, :customlists, :partial => "projects/settings/custom_list_form", :locals => {:list => customlist}
			else
				page[:pclerrors].replace_html customlist.errors.full_messages.join("<br />")
			end
		end
	end

	def destroy
		ProjectCustomList.destroy(params[:id])
		render :update do |page|
			page.remove "fs#{params[:id]}"
		end
	end


end
