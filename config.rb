# Require slim
require 'slim'
set :slim, :pretty => true

# Enable pretty URLS
activate :directory_indexes

###
# Blog settings
###
activate :blog do |blog|
  blog.sources = "/posts/:year-:month-:day-:title.html"
  blog.layout  = 'article'
end

###
# Pages
#333
page "/feed.xml",   :layout => false
page "/about.html", :layout => 'page'

set :css_dir,   'stylesheets'
set :js_dir,    'javascripts'
set :images_dir, 'images'

###
# Build-specific configuration
###
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css
  
  # Minify Javascript on build
  # activate :minify_javascript
  
  # Enable cache buster
  # activate :cache_buster
  
  # Use relative URLs
  # activate :relative_assets
  
  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
end
