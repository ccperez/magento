var dlgEntryForm, dlgLoginForm, form;

function helpers() {
	var tips = $(".validateTips");

	this.updateTips = function(msg) {
		tips.text("* " + msg).addClass("ui-state-highlight");
    	setTimeout(function() {
      tips.removeClass("ui-state-highlight", 2500);
      // tips.text("* All form fields are required.");
    }, 2500 );
	}

	this.isEmpty = function(obj, name) {
	  var valid = true;

    if (obj.val().length < 1) {
      obj.addClass("ui-state-error");
      this.updateTips(name + " should not be empty!");
      valid = false;
    }

    return valid;
	}

	this.checkRegExp = function(obj, regexp, msg) {
		var valid = true;

		if (!(regexp.test(obj.val()))) {
			obj.addClass("ui-state-error");
			this.updateTips(msg);
			valid = false;
		}

		return valid;
  }

  this.errorMessage = function(status, obj, msg) {
  	var valid = true;

		if (parseInt(status) == 0) {
			obj.addClass("ui-state-error");
			this.updateTips(msg);
			valid = false;
		}

		return valid;
  }
}

function isNumberKey(evt) {
	var charCode = (evt.which) ? evt.which : event.keyCode
	if (charCode > 31 && (charCode < 48 || charCode > 57))
	  return false;

	return true;
}

function openYouTube(id) {
	//YouTube Player Parameters
	var width = 640;
	var height = 505;
	var FullScreen = "yes";
	var AutoPlay = "yes";
	var HighDef = "yes";

	//Calculate Page width and height
	var pageWidth = window.innerWidth;
	var pageHeight = window.innerHeight;
	if (typeof pageWidth != "number"){
	if (document.compatMode == "CSS1Compat"){
	      pageWidth = document.documentElement.clientWidth;
	      pageHeight = document.documentElement.clientHeight;
	} else {
	      pageWidth = document.body.clientWidth;
	      pageHeight = document.body.clientHeight;
	      }
	}
	// Make Background visible...
	var divbg = document.getElementById('bg');
	divbg.style.visibility = "visible";

	//Create dynamic Div container for YouTube Popup Div
	var divobj = document.createElement('div');
	divobj.setAttribute('id',id); // Set id to YouTube id
	divobj.className = "popup";
	divobj.style.visibility = "visible";
	var divWidth = width + 4;
	var divHeight = height + 20;
	divobj.style.width = divWidth + "px";
	divobj.style.height = divHeight + "px";
	var divLeft = (pageWidth - divWidth) / 2;
	var divTop = (pageHeight - divHeight) / 2 - 10;
	//Set Left and top coordinates for the div tag
	divobj.style.left = divLeft + "px";
	divobj.style.top = divTop + "px";
	divobj.style.zIndex = "100";
	divobj.style.position = "absolute";

	//Create dynamic Close Button Div
	var closebutton = document.createElement('div');
	closebutton.style.visibility = "visible";
	closebutton.style.background = "#000000";
	closebutton.style.color = "#ffffff";
	closebutton.innerHTML = "<span onclick=\"closeYouTube('" + id +"')\" class=\"close_button\" style=\"Verdana, Geneva, sans-serif;font-size: small;font-weight: bold;color: #666;text-decoration: none;display: block;float: right;background-color: #FFF;z-index: 3;cursor: pointer;border: 2px solid #666;margin-bottom: -2px;padding: 0px 3px 0px 3px;margin-right: 4px;\">X</span>";
	//Add Close Button Div to YouTube Popup Div container
	divobj.appendChild(closebutton);

	//Create dynamic YouTube Div
	var ytobj = document.createElement('div');
	ytobj.setAttribute('id', "yt" + id);
	ytobj.className = "ytcontainer";
	ytobj.style.width = width + "px";
	ytobj.style.height = height + "px";
	if (FullScreen == "yes") FullScreen="&fs=1"; else FullScreen="&fs=0";
	if (AutoPlay == "yes") AutoPlay="&autoplay=1"; else AutoPlay="&autoplay=0";
	if (HighDef == "yes") HighDef="&hd=1"; else HighDef="&hd=0";
	var URL = "http://www.youtube.com/v/" + id + "&hl=en&rel=0&showsearch=0" + FullScreen + AutoPlay + HighDef;
	var YouTube = "<object width=\"" + width + "\" height=\"" + height + "\">";
	YouTube += "<param name=\"movie\" value=\"" + URL + "\"></param>";
	YouTube += "<param name=\"allowFullScreen\" value=\"true\"></param><param name=\"allowscriptaccess\" value=\"always\"></param>";
	YouTube += "<embed src=\"" + URL + "\" type=\"application/x-shockwave-flash\" ";
	YouTube += "allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"" + width + "\" height=\"" + height + "\"></embed></object>";
	ytobj.innerHTML = YouTube;
	//Add YouTube Div to YouTube Popup Div container
	divobj.appendChild(ytobj);

	//Add YouTube Popup Div container to HTML BODY
	document.body.appendChild(divobj);
}

function closeYouTube(id){
	var divbg = document.getElementById('bg');
	divbg.style.visibility = "hidden";
	var divobj = document.getElementById(id);
	var ytobj = document.getElementById("yt" + id);
	divobj.removeChild(ytobj); //remove YouTube Div
	document.body.removeChild(divobj); // remove Popup Div
}