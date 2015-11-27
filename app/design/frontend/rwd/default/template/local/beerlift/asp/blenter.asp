<!--#include virtual="/UNITEDHOBBIES/includes/settings.asp"--> 
<!--#include virtual="/UNITEDHOBBIES/includes/getSettingKey.asp"--> 
<!--#include virtual="/UNITEDHOBBIES/includes/databaseFunctions.asp"--> 
<!--#include virtual="/UNITEDHOBBIES/includes/screenMessages.asp"-->
<!--#include virtual="/UNITEDHOBBIES/includes/currencyFormat.asp"--> 
<!--#include virtual="/UNITEDHOBBIES/includes/priceFunctions.asp"-->
<!--#include virtual="/UNITEDHOBBIES/includes/stringFunctions.asp"-->
<!--#include virtual="/UNITEDHOBBIES/includes/sessionFunctions.asp"-->  
<!--#include virtual="/UNITEDHOBBIES/includes/miscFunctions.asp"-->  
<!--#include virtual="/UNITEDHOBBIES/includes/itemFunctions.asp"-->  
<!--#include virtual="/UNITEDHOBBIES/includes/cartFunctions.asp"-->
<%
dim mySQL, connTemp, rsTemp, pIdCategory, pCategoryDesc, totalPages, count, pIdAffiliate, pDefaultLanguage, pStoreFrontDemoMode, pCurrencySign, pDecimalSign, pCompany, pCompanyLogo, pAuctions, pListBestSellers, pNewsLetter, pPriceList, pStoreNews, pOneStepCheckout, pAffiliatesStoreFront, pCategoriesAlphOrder, pAllowNewCustomer, curPage, pHeaderKeywords, pLanguage, pCustomerName, pHeaderCartItems, pHeaderCartSubtotal, pMoneyDontRound, pIdParentCategory, pImageCategory, indexCategories, pIdCategory2, f, pIdProduct, pDescription, pSmallImageUrl, pStock, pDetails, pListPrice, pSpecialPrice, pIdCustomerType, pShowBtoBPrice, pCompareProducts, pUnderStockBehavior
pStoreFrontDemoMode 	= getSettingKey("pStoreFrontDemoMode")
pCurrencySign	 	= getSettingKey("pCurrencySign")
pDecimalSign	 	= getSettingKey("pDecimalSign")
pCompany	 	= getSettingKey("pCompany")
pProductReviews		= getSettingKey("pProductReviews")
pAuctions		= getSettingKey("pAuctions")
pSuppliersList		= getSettingKey("pSuppliersList")
pNewsLetter 		= getSettingKey("pNewsLetter")
pAffiliatesStoreFront   = getSettingKey("pAffiliatesStoreFront")
pAllowNewCustomer	= getSettingKey("pAllowNewCustomer")
pRssFeedServer		= getSettingKey("pRssFeedServer")
pRealTimeShipping	= lCase(getSettingKey("pRealTimeShipping"))
pCategoriesAlphOrder	= getSettingKey("pCategoriesAlphOrder")

' session
pIdCustomer     	= getSessionVariable("idCustomer",0)
pIdCustomerType 	= getSessionVariable("idCustomerType",1)
%>
<style>
	.middle { display: table; width: 100%; height: 100%; }
	.middle .middle-helper { *display: inline-block; *height: 100%; vertical-align: middle; }
	.middle .middle-content { display: table-cell; *display: inline; width: 100%; vertical-align: middle; }
	
	.beerliftFormContainer{
		position: relative;
		width:472px;
		height:271px;
		margin:50px auto 0;
		background-image:url('images/beerlift/images/beerlift_form_bg.png');
	}
	.beerliftFormWrapper{
		position: absolute;
		width: 265px;
		height:271px;
		top: 0px;
		left: 185px;
	}
	
	.beerliftFormBg{
		position:absolute;
		width:100%;
		height:100%;
		background-color:black;
		opacity: 0.8;
		filter: alpha(opacity=80); /* For IE8 and earlier */
	}
	.beerliftPrizeClose{
		position:absolute;
		top:-20px;
		right:-10px;
		z-index:2;
	}
	.beerliftPrizeLogo{
		position:absolute;
		top:-20px;
		left:-36px;
		z-index:2;
	}
	
</style>
<div class="beerliftFormBg"></div>
<div class="beerliftFormContainer">
	<div class="beerliftPrizeLogo">
		<img src="images/beerlift/images/beerlift_logo_2.png">
	</div>
	<div class="beerliftPrizeClose">
		<img src="images/beerlift/images/beerlift_pop_close.png"  onclick="$('#hoverdiv').height('');document.getElementById('hoverdiv').innerHTML=''" style="cursor:pointer">
	</div>
	<div class="beerliftFormWrapper">
		<div class="middle">
			<span class="middle-helper"></span>
			<div class="middle-content">
			
				<% if pIdCustomer = 0 then %>
				<form name="BLFORM" method="post" action="uh_customerAuthenticateExec.asp" style="margin-bottom:0; ">
					<input type="hidden" value="beerlift" name="redirect">
					<!--br-->
					<table width="225" border="0" cellspacing="0" cellpadding="0" style="margin:0 auto; ">
						<tr>
							<td width="225">
								<!--Close-->
								<!--table width="426" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="369"><img src="images/beerlift/images/enter_img01.jpg" /></td>
										<td width="57"><img src="images/beerlift/images/enter_close.png"  onclick="document.getElementById('hoverdiv').innerHTML=''" style="cursor:pointer"></td>
									</tr>
								</table-->
								<!--End Close-->
							</td>
						</tr>
						<tr>
							<td width="225">
								<table width="225" border="0" cellspacing="0" cellpadding="0">
									<!--tr>
									  <td colspan="3" width="426"><img src="images/beerlift/images/enter_img02.png" /></td>
									  </tr-->
									<tr>
										<!--td width="27" valign="top" bgcolor="#ffc000"><img src="images/enter_img03.jpg" style="width:27px; height:105px;" /></td-->
										<td width="225" valign="top" bgcolor="transparent">
											<table width="225" border="0" cellspacing="0" cellpadding="5">
												<tr>
													<td align="left"><font face="Verdana, Arial, Helvetica, sans-serif" style="font-size:14px;">EMAIL:</font></td>
												</tr>
												<tr>
													<td><input type="text" size="30" value="<%= Session("EMAIL") %>"  id="inputEmail" name="email" style="width:100%; height:30px;" /></td>
												</tr>
												<tr>
													<td align="left"><font face="Verdana, Arial, Helvetica, sans-serif" style="font-size:14px;">PASSWORD:</font></td>
												</tr>
												<tr>
													<td><input type="password" size="30" value="" id="inputPassword" name="password" style="width:100%; height:30px;" /></td>
												</tr>
												<tr>
													<td colspan="2" align="center" style="text-align:center;"><INPUT type="image" src="images/beerlift/images/beerlift_enter.png" /></td>
												</tr>    
											</table>
										</td>
										<!--td width="19" valign="top"><img src="images/enter_img04.png" style="width:20px; height:105px;" /></td-->
									</tr>
									<!--tr>
										<td colspan="3" width="426" valign="top"><img src="images/enter_img05.png" /></td>
									</tr-->
								</table>
							</td>
						</tr>
				  </form>
				<% else
				  sqlfetch ="Select name, lastname from customers where idcustomer ="&pIdCustomer
				  call getFromDatabase (sqlfetch, rs, "beerlift")
					if not rs.eof then
						strname = rs("name")
						strlastname = rs("lastname")
					end if

				%>
				<FORM name="BLFORM" method="post" onsubmit="return validateBeerLiftForm()" action="blenterExec.asp" style="margin-bottom:0; ">
				<input type="hidden" value="beerlift" name="redirect">
				<!--br-->
					<!--FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF-->
					<table width="426" border="0" cellspacing="0" cellpadding="0">
						<!--tr>
							<td width="426"-->
								<!--Close-->
								<!--table width="426" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="369"><img src="images/beerlift/images/enter_img01.jpg" /></td>
										<td width="57"><img src="images/beerlift/images/enter_close.png"  onclick="document.getElementById('hoverdiv').innerHTML=''" style="cursor:pointer"></td>
									</tr>
								</table-->
								<!--End Close-->
							<!--/td>
						</tr-->
						<tr>
							<td width="265">
								<table width="265" border="0" cellspacing="0" cellpadding="0">
									<!--tr>
										<td colspan="3" width="426"><img src="images/beerlift/images/enter_img02.png" /></td>
									</tr-->
									<tr>
										<!--td width="27" valign="top" bgcolor="#ffc000"><img src="images/enter_img03.jpg" /></td-->
										<td width="265" valign="top" bgcolor="transparent">
											<table width="265" border="0" cellspacing="0" cellpadding="5">
												<tr>
													<td width="110" align="right"><font face="Verdana, Arial, Helvetica, sans-serif" style="font-size:10px">NAME:</font></td>
													<td width="155"><%=strname%>&nbsp;<%=strlastname%></td>
												</tr>
												<tr>
													<td align="right"><font face="Verdana, Arial, Helvetica, sans-serif" style="font-size:10px">CONFIG:</font></td>
													<td><select style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif; background-color: transparent; width:155px" name="blconfig">
														<option value="1">TRI</option>
														<option value="2">QUAD</option>
														<option value="3">HEX</option>
														<option value="4">OCTO</option>
														<option value="5">OTHER</option>
													</select></td>
												</tr>
												<tr>
													<td align="right"><font face="Verdana, Arial, Helvetica, sans-serif" style="font-size:10px">WEIGHT LIFTED:</font></td>
													<td><input name="weightlifted" id="whl" type="text" size="20" style=" display:block; width:155px; font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif; background-color: transparent;" onKeyPress="return isNumberKey(event)"><!--&nbsp;-->
													<select style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif; background-color: transparent;" name="weightType">
														<option value="1">GR</option>
														<option value="2">OZ</option>
													</select></td>
												</tr>
												<tr>
													<td align="right"><font face="Verdana, Arial, Helvetica, sans-serif" style="font-size:10px">CLASS:</font></td>
													<td><select style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif; background-color: transparent; width:155px" name="blclass">
														<option value="1">UNLIMITED</option>
														<option value="2">CLASS 250MM</option>
														<option value="3">CLASS 500MM</option>
														<option value="4">DISASTER</option>
													</select></td>
												</tr>
												<tr>
													<td align="right"><font face="Verdana, Arial, Helvetica, sans-serif" style="font-size:10px">YOUTUBE URL:</font></td>
													<td><input type="text" size="25" style="width:155px; font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif; background-color: transparent;" value="http://www.youtube.com/" onClick="this.value=''" id="ytlink" name="ytlink"></td>
												</tr>
												<tr>
													<td colspan="2" align="center"><INPUT type="image" src="images/beerlift/images/beerlift_enter.png" /></td>
												</tr>    
											</table>
										</td>
										<!--td width="19" valign="top"><img src="images/enter_img04.png" /></td-->
									</tr>
									<!--tr>
										<td colspan="3" width="426" valign="top"><img src="images/enter_img05.png" /></td>
									</tr-->
								</table>
							</td>
						</tr>
					</table>
					<!--FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF-->    
				</FORM>

				<% end if %>
			</div>
			</span>
		</div>
	</div>
</div>