function entryForm() {
	var isLogin = $("#idcustomer").val().length;

	if(isLogin) { 
		dlgEntryForm.dialog("open");
	} else {
		dlgLoginForm.dialog("open");
	}
}

function showPrizesRules() {
	$("#dlgPrizesRules").dialog({width: 550});
}

function showThankYou(data) {
	dlgEntryForm.dialog("close");
	console.log(JSON.stringify(data));
	if (data != "") {
		$("#dlgThankYou").dialog({width: 540});
	}
}

function getBeerlift(clsBL) {
	$("#spnBL_"+clsBL).html("Loading...&nbsp;");
	$.post("/magento1910/beerlift/index/get_more_beerlift/class/"+clsBL,
	function(data) {
		if (data != "") {
			$("#spnBL_"+clsBL).html("&nbsp;");
			$("#snBL_"+clsBL).html(data);
		}	
	});
}
