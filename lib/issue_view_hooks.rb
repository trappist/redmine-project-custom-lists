class IssueViewHooks < Redmine::Hook::ViewListener
	def view_issues_form_details_bottom(context={})
		lists = context[:issue].project.project_custom_lists
		if lists.any?
			html = "<div class=\"splitcontentleft attributes\">"
			lists.each_with_index do |list,idx|
				html << "<p>#{project_custom_list_tag_with_label(list,context[:issue])}</p>"
				html << "</div><div class=\"splitcontent#{idx.even? ? "right" : "left"} attributes\">"
			end
			html << "<div style=\"clear:both;\"> </div>"
		else
			""
		end
	end

	def view_issues_show_details_bottom(context={})
		issue = context[:issue]
		customs = issue.project_custom_values
		html = ""
		customs.each_with_index do |value,idx|
			html << "<td valign=\"top\"><b>#{value.project_custom_list.name}:</b></td>"
			html << "<td valign=\"top\">#{value.value}</td>"
			html << "<tr></tr>" if idx.odd?
		end
		html
	end

  def project_custom_list_tag(list, issue)
    field_name = "project_custom_lists[#{list.id}]"
    field_id = "project_custom_lists_#{list.id}"
		selected = (issue.project_custom_values & list.project_custom_values).first
		blank_option_text = "<option value=\"\">--- #{l(:actionview_instancetag_blank_option)} ---</option>"
		blank_option = list.is_required? ? (list.default_value.blank? ? blank_option_text : "") : '<option></option>'
		options = options_for_select(list.possible_values.map{|v|[v.value,v.id]},(selected ? selected.id : nil))
		select_tag(field_name,blank_option+options,:id => field_id)
  end
  
  def project_custom_list_label_tag(list)
    content_tag "label", list.name + (list.is_required? ? " <span class=\"required\">*</span>" : ""), :for => "#{list.name}_project_custom_values_#{list.id}"
  end
  
  def project_custom_list_tag_with_label(list, issue)
    project_custom_list_label_tag(list) + project_custom_list_tag(list,issue)
  end

end
