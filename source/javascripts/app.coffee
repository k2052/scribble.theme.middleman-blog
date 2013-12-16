#= require 'prism/prism'
#= require 'prism/plugins/line-numbers/prism-line-numbers'
#= require 'prism/components/prism-coffeescript'
#= require 'bigtext'

$(document).ready ->
	WebFont.load
		google:
			families: ["Josefin Slab:400,300,100,700,600"]
		active: ->
			$('.article-title').bigtext()
