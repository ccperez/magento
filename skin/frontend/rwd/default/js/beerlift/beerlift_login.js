$(function() {
	var helper = new helpers();

	var 
		frmBeerLogin = $('#frmBeerLogin'),
		email     	 = $("#email"),
		password  	 = $("#password"),
		arFields		 = ['email', 'password'],
		allFields 	 = $([]).add(email).add(password);

	function loginBeerlift(inputs) {
		var valid 		= true,
			emailRegExp = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/,
			passRegExp  = /^([0-9a-zA-Z])+$/;

		allFields.removeClass("ui-state-error");

		valid = valid && helper.isEmpty(email, "Email");
		valid = valid && helper.isEmpty(password, "Password");

		valid = valid && helper.checkRegExp(email, emailRegExp, "eg. email@hobbyking.com" );
		valid = valid && helper.checkRegExp(password, passRegExp, "Password field only allow: a-z 0-9");

		if (valid) {
			$(".validateTips").html("Loading...&nbsp;");
			$.post("/magento1910/beerlift/index/userlogin", 
				frmBeerLogin.serialize()).done(function( login ) {
				console.log(JSON.stringify(login));
				$(".validateTips").html("&nbsp;");
				if (helper.errorMessage(login.status, password, login.message)) {
					dlgLoginForm.dialog("close");
					customerInfo(login);
					entryForm();
				}
			});
		}
	}

	dlgLoginForm = $("#dlgLoginForm").dialog({
			autoOpen: false, height: 300, width: 400, modal: true,
			buttons: {
				"Enter": function() {
					loginBeerlift(arFields);
				}
			},
			close: function() {
				frmBeerLogin[0].reset();
				allFields.removeClass("ui-state-error");
			}
  });

	form = dlgLoginForm.find("form").on("submit", function(event) {
		event.preventDefault();
		loginBeerlift(arFields);
	});

	function customerInfo(login) {
		$('#idcustomer').val(login.customer_id);
		$('#countrycode').val(login.customer_country_id);
		$('#spnCustomerName').text(login.customer_name);
	}  

});
