$(document).ready(function(){
	new ZeroClipboard($("#clip_button"));
	$("#clip_button").click(function() {
    	Materialize.toast(
			"Link copied to Clipboard",
    		5000, "white black-text rounded"
		);
  	});
});