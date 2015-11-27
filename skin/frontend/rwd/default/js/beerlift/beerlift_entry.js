$(function() {
	var helper = new helpers();

  var
  	frmBL 			 = $('#frmBL'),
    config 			 = $("#config"),
    weightLifted = $("#weightLifted"),
    weightType   = $("#weightType"),
    blClass			 = $("#blClass"),
    ytlink       = $("#ytlink"),
    arFields     = ['config', 'weightLifted', 'weightType', 'blClass', 'ytlink'],
    allFields    = $([]).add(config).add(weightLifted).add(weightType).add(blClass).add(ytlink);

	function addBeerlift(inputs) {
		var valid = true;

		allFields.removeClass("ui-state-error");

		valid = valid && helper.isEmpty(config, "Config");		
		valid = valid && helper.isEmpty(weightLifted, "Weight lifted");
		valid = valid && helper.isEmpty(weightType, "Weight type");  
		valid = valid && helper.isEmpty(blClass, "Class");		
		valid = valid && helper.isEmpty(ytlink, "Youtube URL");      	

		if (valid) {
			// var result = ajax('POST', '/magento1910/beerlift/index/create', frmBL.serialize());
			$(".validateTips").html("Loading...&nbsp;");
			$.post("/magento1910/beerlift/index/create", 
				frmBL.serialize()).done(function( data ) {
				$(".validateTips").html("&nbsp;");
				showThankYou(data);
			});
		}
	}

	dlgEntryForm = $("#dlgEntryForm").dialog({
			autoOpen: false, height: 325, width: 400, modal: true,
			buttons: {
				"Enter": function() {
					addBeerlift(arFields);
				}
			},
			close: function() {
				frmBL[0].reset();
				allFields.removeClass("ui-state-error");
			}
  });

	form = dlgEntryForm.find("form").on("submit", function(event) {
		event.preventDefault();
		addBeerlift(arFields);
	});

});
