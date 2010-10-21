require 'redmine'
require_dependency 'custom_js_and_css/hooks'

Redmine::Plugin.register :redmine_custom_js_and_css do
  name 'Custom JS and CSS plugin'
  author 'Alexander Sapozhnikov'
  description 'Customizing Redmine: execute custom JavaScript and apply custom CSS'
  version '0.0.1'
  url 'http://github.com/shoorick/redmine_custom_js_and_css'
  author_url 'http://shoorick.ru/'
end
