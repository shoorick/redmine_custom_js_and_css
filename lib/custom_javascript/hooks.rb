# This class hooks into Redmine's View Listeners in order to
# add content to the page
class Hooks  < Redmine::Hook::ViewListener

  # Custom styles
  def view_layouts_base_html_head(context = { })
    prj = context[:project] || return
    id = prj.identifier
    if File.file?(
      File.dirname(__FILE__) + "/../../assets/stylesheets/by_project/#{id}.css"
    )
      stylesheet_link_tag "by_project/#{id}", :plugin => 'redmine_custom_javascript'
    end
  end

  # Call javascript if found corresponding file for every project
  def view_layouts_base_body_bottom(context = { })
    prj = context[:project] || return
    hookname = 'layouts_base_body_bottom'
    if User.current.logged?
      id = prj.identifier
      if File.file?(
        File.dirname(__FILE__) + "/../../assets/javascripts/by_project/#{id}/#{hookname}.js"
      )
        javascript_include_tag "by_project/#{id}/#{hookname}", :plugin => 'redmine_custom_javascript'
      end
    end
  end

  # Try to add hook to bottom of issue form
  def view_issues_form_details_bottom(context = { })
    prj = context[:project] || return
    id = prj.identifier
    hookname = 'issues_form_details_bottom'
    if File.file?(
        File.dirname(__FILE__) + "/../../assets/javascripts/by_project/#{id}/#{hookname}.js"
    )
        javascript_include_tag "by_project/#{id}/#{hookname}", :plugin => 'redmine_custom_javascript'
    end
  end

end
