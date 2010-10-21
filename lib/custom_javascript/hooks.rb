# This class hooks into Redmine's View Listeners in order to
# add content to the page
class Hooks  < Redmine::Hook::ViewListener

  # Adds the Google Analytics code to the layout if the current user meets
  # the conditions setup by the System Administrator
  def view_layouts_base_body_bottom(context = { })
    if (!User.current.anonymous?)
      '<script language="JavaScript" src="/plugin_assets/redmine_custom_javascript/javascripts/index.js"></script>'
    end
  end
end
