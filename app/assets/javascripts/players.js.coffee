# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$('#players').dataTable( {
	        "aaSorting": [[ 2, "desc"]]
			"iDisplayLength": 25
	    } );