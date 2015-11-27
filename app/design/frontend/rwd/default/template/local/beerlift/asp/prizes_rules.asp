<!--br-->
<style>
	.beerliftPrizeWrap{
		position: relative;
		width: 473px;
		margin: 30px auto;
		padding-top: 20px;
		z-index:1;
	}
	.beerliftPrizeBg{
		position:absolute;
		width:100%;
		height:100%;
		background-color:black;
		opacity: 0.8;
		filter: alpha(opacity=80); /* For IE8 and earlier */
	}
	.beerliftPrizeClose{
		position:absolute;
		top:0;
		right:-10px;
		z-index:2;
	}
	.beerliftPrizeLogo{
		position:absolute;
		top:0;
		left:-36px;
		z-index:2;
	}
</style>
<div class="beerliftPrizeBg" style="position:absolute; width:100%; height:100%; background-color:black; opacity: 0.8; filter: alpha(opacity=80); /* For IE8 and earlier */"></div>
<DIV  class="beerliftPrizeWrap" style="position: relative;width: 473px;margin: 30px auto;padding-top: 20px;z-index:1;">
      <!--table width="426" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="369"><img src="images/beerlift/images/enter_img01.jpg" /></td>
        <td width="57"><img src="images/beerlift/images/enter_close.png?v=1.0.1"  onclick="document.getElementById('hoverdiv').innerHTML=''" style="cursor:pointer"></td>
      </tr>
    </table-->
<div class="beerliftPrizeLogo" style="position:absolute; top:0; left:-36px; z-index:2;">
	<img src="images/beerlift/images/beerlift_logo.png?v=1.0.1">
</div>
<div class="beerliftPrizeClose" style="position:absolute; top:0; right:-10px; z-index:2;">
	<img src="images/beerlift/images/beerlift_pop_close.png?v=1.0.1"  onclick="$('#hoverdiv').height('');document.getElementById('hoverdiv').innerHTML=''" style="cursor:pointer">
</div>
<table width="472" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="3" width="472"><img src="images/beerlift/images/rules_img02.png?v=1.0.1" width="472" height="566" /></td>
        </tr>
      <tr width="472">
        <td width="20" valign="top" bgcolor="#FFFFFF"></td>
        <td width="432" valign="top" bgcolor="#FFFFFF">
			<font face="Verdana, Arial, Helvetica, sans-serif" size="-2">
			<table width="432" border="0" cellspacing="2" cellpadding="2">
			<!-- Start: 20151027: Conrad: set expiry date -->
			<% if cDate(now) > cDate("10/31/2015 23:59") then %>
			<tr>
				<td width="432" valign="top">
					<h4>Lifting season is now over!<%= cDate(now) %></h4>
					<p style="margin-left: 0;">Please wait while we deliberate and check final results, with the winners announced on the 4th of November. Thanks to all who entered!</p>
				</td>
			</tr>			
			<% else %>				
			<tr>
				<td width="432" valign="top">
					<h4>Beer Lift 2015</h4>
					<p style="margin-left: 0;">It’s that time of the year again… it’s time to lift some beer! You’ve all seen this one before and it’s time to get your entries in.  For those who haven’t experienced the HobbyKing Beer Lift it’s simple, the one who lifts the most beer wins. And by wins, we means there’s $2,500 worth of store credits up for grabs.</p>
					<p style="margin-left: 0;">There are 3 classes: 250, 500 and for those boys who like big toys there’s the Unlimited Class. </p>
					<p style="margin-left: 0;">And for those who had a go, but failed big time, there’s also $500 up for grabs in Disaster Class. That’s right, $500 in store credits just for owning the biggest failure. </p>
					<p style="margin-left: 0;">If you don’t win we have loads of MultiStar batteries for the runner ups. </p>
					<p style="margin-left: 0;">So check out the rules and post your entries here.</p>
					<!--h4>Beerlifting season is now over.</h4>
					<p style="margin-left: 0;">Well done to everybody that entered, and congratulations to our winners!</p>
					<p style="margin-left: 0;">This year we saw more beer being lifted than has ever been lifted before! There were many great entries, but I’m sure we would all agree that Olaf’s machine was truly impressive, and it was a well deserved win.</p>
					<p style="margin-left: 0;">We hope to see you all enter again next year!</p-->
				</td>
			</tr>
			<tr>
				<td width="432" valign="top">
					<h4>RULES</h4>
					<p style="margin-left: 0;">The classes are: (measurements made diagonally from centre of prop hub to prop hub)</p>
					<p style="margin-left: 0;">250: 250mm and less</p>
					<p style="margin-left: 0;">500: 251mm to 500mm</p>
					<p style="margin-left: 0;">Unlimited: 501mm up</p>
					<p style="margin-left: 0;">Disaster Class: Any sized multirotor that has seen better days</p>
				</td>
			</tr>
			<tr>
				<td width="432" valign="top">
					<h4>All video submissions must include the following in one take with no editing:</h4>
					<ul>
						<li>- weighing of the beer</li>
						<li>- measuring of the multirotor</li>
						<li>- confirmation of battery used</li>
					</ul>
					<p style="margin-left: 0;">The video must clearly show the weight of the beer cans/bottles prior to flight along with the diameter of the multirotor shown in centimetres. Any video that appears to be edited after the weigh-in will not be accepted. The judge’s decision is final.</p>
					<p style="margin-left: 0;">The multirotor must be built in 2014-2015 and cannot be a previous entrant in HobbyKing’s 2014 or prior Beer Lifts. </p>
					<p style="margin-left: 0;">To qualify you must be using MultiStar, Nano-Tech, Nano-Tech A-Spec, Zippy or Turnigy Li-Poly batteries.</p>
					<p style="margin-left: 0;">The multirotor must be able to lift the payload for at least 10 seconds.</p>
					<p style="margin-left: 0;">Videos must be uploaded to YouTube and linked to us through our official entry form.</p>
					<p style="margin-left: 0;">If beer cannot be used, entries using other drinkable liquids will be accepted.</p>
					<p style="margin-left: 0;">Disaster Class winner is determined on many factors... but mainly what the judges find funniest (bring the lolz).</p>
					<p style="margin-left: 0;">The maximum store credit prize for Unlimited Class is $1000, 500 Class is $500 and 250 Class is $500. All entries must be submitted before midnight on the 1st November 2015.  No entries will be accepted after this time, so get yours in early. </p>
					<p style="margin-left: 0;">To encourage entrants to get their entries in early the value of each prize will reduce by $50 every week after the 1st September. For example if you get your Unlimited Class entry in on the 31st August and you are the winner, you will receive $1,000. If you are the winner and your entry was submitted on the 7th September you will win $950. From this point the prize will drop $50 every week, so get you entry in early.</p>
				</td>
			</tr>
			<% end if %>
			<!-- 20151027: Conrad: set expiry date -->

				<!--td width="432" valign="top">
					<h4>RULES</h4>
					<p style="margin-left: 0;">The classes are: (measurements made diagonally from centre of prop hub to prop hub)</p>
					<p style="margin-left: 0;">250: 250mm and less</p>
					<p style="margin-left: 0;">500: 251mm to 500mm</p>
					<p style="margin-left: 0;">Unlimited: 501mm up</p>
					<p style="margin-left: 0;">Disaster Class: Any sized multirotor that has seen better days</p>
				</td-->
			  </tr>
			<%
			'    <td width="432" valign="top">All submissions must include the following in one take with no editing:'
			''
			'    <li>Weighing of the beer.</li>'
			'    <li>Measuring of the multirotor.</li>'
			'    <li>Confirmation of battery used.</li>'
			''
			'    </td>'
			'  </tr>'
			'  <tr>'
			'    <td valign="top">2.</td>'
			'    <td valign="top">To qualify you must be using Nano-Tech, Nano-Tech A-Spec, Zippy or Turnigy Li-Poly Batteries.</td>'
			'  </tr>'
			'  <tr>'
			'    <td valign="top">3.</td>'
			'    <td valign="top">The multirotor must be able to lift the payload for at least 10 seconds.</td>'
			'  </tr>'
			'  <tr>'
			'    <td valign="top">4.</td>'
			'    <td valign="top">Videos must be uploaded to youtube and linked to us through our official entry form.</td>'
			'  </tr>'
			'  <tr>'
			'    <td valign="top">5.</td>'
			'    <td valign="top">If beer cannot be used, entries using other drinkable liquids will be accepted.</td>'
			'  </tr>'
			'  <tr>'
			'    <td valign="top">6.</td>'
			'    <td valign="top">700MM Class, all models with a diameter of less than 700MM with any number of motors.</td>'
			'  </tr>'
			'    <tr>'
			'      <td valign="top">7.</td>'
			'      <td valign="top">Unlimited Class, Multirotors over 700mm with any number of motors.</td>'
			'    </tr>'
			'    <tr>'
			'      <td valign="top">8.</td>'
			'      <td valign="top">Disaster Class winner is determined on many factors... but mainly what the judges find funniest (bring the lolz).</td>'
			'    </tr>'
			'    <tr>'
			'      <td valign="top">9.</td>'
			'      <td valign="top">The store credit prize for Unlimited class is $1000 &amp; $500 for 700MM class if the winning entry is submitted before the 1st of May 2013. To deter people from delaying their entry until the end of the competition (sniping), the top prize is reduced by $50 (Unlimited) &amp; $25 (700MM) every week for entries submitted after this date. The sooner you enter, the bigger the prize!</td>'
			'    </tr>'
			'    <tr>'
			'      <td valign="top">10.</td>'
			'      <td valign="top">2012 entries are not eligible.</td>'
			'    </tr>'
			'  <tr>'
			'    <td valign="top">11.</td>'
			'    <td valign="top">BeerLift Season and competition closes on June 30.</td>'
			'  </tr>'
			'  <tr>'
			'    <td colspan="2" valign="top">'
			'<strong>How to shoot your video.</strong><br />'
			'The video must clearly show the weight of the beer cans prior to flight along with the diameter of the multirotor shown in centimeters. Any video that appears to be edited after the weigh-in will not be accepted. The judge’s decision is final.</td>'
			'    </tr>'
			'      <tr>'
			'    <td colspan="2" valign="top" align="center">'
			'    <iframe id="dailyVideo" width="350" height="230" src="http://www.youtube.com/embed/OVIrsfb4JTo?wmode=opaque&autohide=1&autoplay=0&controls=0&modestbranding=1&rel=0&color2=FFFFFF&color2=FFFFFF&playlist=OVIrsfb4JTo"  frameborder="0"  scrolling="no" style="overflow-x: hidden; overflow-y: hidden;" allowfullscreen></iframe>'
			'    </td>'
			'    </tr>'
			%>
			</table>
			</font>
        </td>
        <td width="20" valign="top"  bgcolor="#FFFFFF"></td>
      </tr>
      <tr>
        <td colspan="3" width="472" valign="top"><img src="images/beerlift/images/rules_img05.png?v=1.0.1" /></td>
        </tr>
    </table>
</DIV>
