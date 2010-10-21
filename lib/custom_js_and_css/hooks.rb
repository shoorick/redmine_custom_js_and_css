# This class hooks into Redmine's View Listeners in order to
# add content to the page
class Hooks  < Redmine::Hook::ViewListener

  ASSETS = File.dirname(__FILE__) + '/../../assets'
  PLUGIN = 'redmine_custom_js_and_css'

  # Custom styles
  def view_layouts_base_html_head(context = { })
    prj = context[:project] || return
    return if prj.nil? 
    id = prj.identifier
    if File.file?( "#{ASSETS}/stylesheets/by_project/#{id}.css" )
      stylesheet_link_tag "by_project/#{id}", :plugin => PLUGIN
    end
  end

  # TODO Rewrite code:
  # need to use script-driven behavior - for each found script should spawned hook
  #
  # 1. Find recursively scripts in assets/javascripts/by_project/#{id}
  # (maybe add _all/some-hook.js for cross-project hooks?
  #
  # 2. Try to include javascript tag for every found hook.

  

  # Call javascript if found corresponding file for every project
  def view_layouts_base_body_bottom(context = { })
    prj = context[:project] || return
    hookname = 'layouts_base_body_bottom'
    if User.current.logged?
      id = prj.identifier
      if File.file?( "#{ASSETS}/javascripts/by_project/#{id}/#{hookname}.js")
        javascript_include_tag "by_project/#{id}/#{hookname}", :plugin => PLUGIN
      end
    end
  end

  # Try to add hook to bottom of issue form
  def view_issues_form_details_bottom(context = { })
    prj = context[:project] || return
    id = prj.identifier
    hookname = 'issues_form_details_bottom'
    if File.file?( "#{ASSETS}/javascripts/by_project/#{id}/#{hookname}.js")
        javascript_include_tag "by_project/#{id}/#{hookname}", :plugin => PLUGIN
    end
  end

end
