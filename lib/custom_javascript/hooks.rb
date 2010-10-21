# This class hooks into Redmine's View Listeners in order to
# add content to the page
class Hooks  < Redmine::Hook::ViewListener

  def view_layouts_base_body_bottom(context = { })
    unless User.current.anonymous?
      javascript_include_tag 'index', :plugin => 'redmine_custom_javascript'
#      '<script language="JavaScript" src="/plugin_assets/redmine_custom_javascript/javascripts/index.js"></script>'
    end
  end

  # Try to add hook to bottom of issue form
  def view_issues_form_details_bottom(context = { })
    id = context[:project].identifier
    if File.file?(
        File.dirname(__FILE__) + '/../../assets/javascripts/by_project/' + id + '/issues_form_details_bottom.js'
    )
      'Found!'
    end
  end
end
