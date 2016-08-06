(function($) {
	var defaultOptions = { width:300, duration:300, mode:"single" };
	
	if (typeof($.myaccordion) != "undefined" && typeof($.myaccordion) != "object") {
		throw new Error("이미 $.myaccordion 이름이 사용되고 있습니다.");
	} else {
		$.myaccordion = {};
	} 
	
	if (typeof($.myaccordion.setDefaults) != "undefined") {
		throw new Error("이미 $.myaccordion.setDefaults 이름이 사용되고 있습니다.");
	}
	
	if (typeof($.prototype.myaccordion) != "undefined") {
		throw new Error("$(selector).myaccordion 메서드가 이미 존재합니다.");
	}

	$.myaccordion.setDefaults = function(options) {
		$.extend(defaultOptions, options);
	};

	$.prototype.myaccordion = function(options) {
		var temp = {};
		$.extend(temp, defaultOptions);
		$.extend(temp, options);
		
		var acc = this;
		acc.css("width", temp.width+"px");
		acc.find("div.header").click(function() {
			if (temp.mode == "toggle") {
				$(this).next().slideToggle(temp.duration);
			} else {
		    	if ($(this).next().is(":visible") == false) {
		    		acc.find("div.content:visible").slideUp(temp.duration);
		    		$(this).next().slideDown(temp.duration);
		    	}
			}			
		});
	};
})(jQuery);