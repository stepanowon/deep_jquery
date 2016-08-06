(function($) {
	var div = $("<div></div>");
	$.htmlencode = function(str) {
		return div.text(str).html();
	}
	
	$.htmldecode = function(str) {
		return div.html(str).text();
	}	
})(jQuery);