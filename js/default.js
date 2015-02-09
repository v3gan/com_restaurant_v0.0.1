jQuery("document").ready(function () {
    var isShowing = false;
	var mostHidden = true;
	var hideAllButtonText = "Hide All";
	var showAllButtonText = "Show All";
	jQuery("#btnHideShow").text(showAllButtonText);
    jQuery("#btnHideShow").click(function (e) {
		if(mostHidden){
			jQuery(".accordion-body").each(function (index, listitem) {
				isShowing = jQuery(this).hasClass('in');
				if (!isShowing) {
					jQuery(this).collapse('toggle');
				}
			});	
			jQuery("#btnHideShow").text(hideAllButtonText);
		}
		if(!mostHidden){
			jQuery(".accordion-body").each(function (index, listitem) {
                isShowing = jQuery(this).hasClass('in');
				if (isShowing) {
					jQuery(this).collapse('toggle');
				}
			});
			jQuery("#btnHideShow").text(showAllButtonText);
		}
        mostHidden = !mostHidden;
    });
	jQuery(".accordion-inner").each(function(index, listitem) {
        jQuery(".bottom-dotted:last",this).removeClass("bottom-dotted");
	});
});