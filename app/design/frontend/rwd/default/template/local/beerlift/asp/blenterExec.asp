<!--#include virtual="/UNITEDHOBBIES/includes/settings.asp"--> 
<!--#include virtual="/UNITEDHOBBIES/includes/databaseFunctions.asp"--> 
<!--#include virtual="/UNITEDHOBBIES/includes/getSettingKey.asp"--> 
<!--#include virtual="/UNITEDHOBBIES/includes/stringFunctions.asp"-->
<!--#include virtual="/UNITEDHOBBIES/includes/sessionFunctions.asp"-->  

<%
	dim mySQL, connTemp, rsTemp, pIdCategory, pCategoryDesc, totalPages, count, pIdAffiliate, pDefaultLanguage, pStoreFrontDemoMode, pCurrencySign, pDecimalSign, pCompany, pCompanyLogo, pAuctions, pListBestSellers, pNewsLetter, pPriceList, pStoreNews, pOneStepCheckout, pAffiliatesStoreFront, pCategoriesAlphOrder, pAllowNewCustomer, curPage, pHeaderKeywords, pLanguage, pCustomerName, pHeaderCartItems, pHeaderCartSubtotal, pMoneyDontRound, pIdParentCategory, pImageCategory, indexCategories, pIdCategory2, f, pIdProduct, pDescription, pSmallImageUrl, pStock, pDetails, pListPrice, pSpecialPrice, pIdCustomerType, pShowBtoBPrice, pCompareProducts, pUnderStockBehavior,pRedirect


	pRedirect 		= getUserInputL(request("redirect"),20)
	pIdCustomer = getSessionVariable("idCustomer",0)

	strWeight   = getuserinput(formatfordb(request.Form("weightlifted")),8)
	strblclass  = getuserinput(formatfordb(request.Form("blclass")),1)
	strblconfig = getuserinput(formatfordb(request.Form("blconfig")),1)
	strytlink   = getuserinput(formatfordb(request.Form("ytlink")),60)
	strweightType = getuserinput(formatfordb(request.Form("weightType")),1)

	if strytlink = "" or strblclass = "" or strweightType = "" or strblconfig = "" or strWeight = "" or strytlink = "http://www.youtube.com/"  then 
	  response.Redirect("beerlift.asp")
	end if

	'convert to grams 28.3495231
	if strweightType = 2 then
		strWeight = strWeight *  28.3495231
	end if	

	sqlupdate ="INSERT INTO beerlift (weight,class,config,youtube,idcustomer,entryDate) VALUES("&strWeight&","&strblclass&","&strblconfig&",'"&strytlink&"',"&pIdCustomer&",getdate())"
	call updateDatabase (sqlupdate, rs, "beerlift")

	If pRedirect="beerlift" Then
		session("thankyou")= "1"
		response.redirect "beerlift.asp"
	End If
%>
