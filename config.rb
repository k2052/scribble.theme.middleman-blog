$:.unshift File.join "#{root}", "lib"

require "kramdown"
require "custom_kramdown_converter"
require "middleman/renderers/custom_kramdown"
require "slim"
require "sprockets-sass"
set :slim, :pretty => true

###
# Blog settings
#
activate :blog do |blog|
  blog.sources = "/posts/:year-:month-:day-:title"
  blog.layout  = 'article'
  blog.permalink = "/:year/:month/:day/:title"
	blog.default_extension = ".md"
end

# Enable pretty URLS
activate :directory_indexes

# Set Build Dir
set :build_dir, "tmp"

###
# Pages
#
page "/feed.xml",   :layout => false
page "/about.html", :layout => 'page'

# Set Asset paths
set :images_dir, 'images'

# Set the Markdown engine
set :markdown_engine, :kramdown

# Set our custom renderer to be used by tilt
::Tilt.mappings.delete('md') # probably not the best idea to delete mappings but it works
::MiddlemanCustomKramdown.middleman_app = self
::Tilt.register(::Middleman::Renderers::CustomKramdownTemplate, ".md")

# Append sprockets paths
sprockets.append_path File.join "#{root}", "source/stylesheets"
sprockets.append_path File.join "#{root}", "source/javascripts"
sprockets.append_path File.join "#{root}", "source/assets/js"
sprockets.append_path File.join "#{root}", "source/assets/css"
sprockets.append_path File.join "#{root}", "bower_components"
sprockets.append_path File.join "#{root}", "vendor/assets/js"
sprockets.append_path File.join "#{root}", "vendor/assets/css"

# Views direcgtores
set :layout_dir, "layouts"

# Parse and sort the articles list

data['articles'].articles.each do |article|
	article['date'] = DateTime.strptime(article['date'], "%Y/%m/%d")
end

data['articles'].articles.sort_by!{|a| a['date']}.reverse
@articles = data['articles'].articles
