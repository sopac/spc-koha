INSERT INTO letter (module, code, name, title, content)
VALUES ('circulation','ODUE','Overdue Notice','Item Overdue','Dear <<borrowers.firstname>> <<borrowers.surname>>,\n\nAccording to our current records, you have items that are overdue.Your library does not charge late fines, but please return or renew them at the branch below as soon as possible.\n\n<<branches.branchname>>\n<<branches.branchaddress1>>\n<<branches.branchaddress2>> <<branches.branchaddress3>>\nPhone: <<branches.branchphone>>\nFax: <<branches.branchfax>>\nEmail: <<branches.branchemail>>\n\nIf you have registered a password with the library, and you have a renewal available, you may renew online. If an item becomes more than 30 days overdue, you will be unable to use your library card until the item is returned.\n\nThe following item(s) is/are currently overdue:\n\n<item>"<<biblio.title>>" by <<biblio.author>>, <<items.itemcallnumber>>, Barcode: <<items.barcode>> Fine: <fine>GBP</fine></item>\n\nThank-you for your prompt attention to this matter.\n\n<<branches.branchname>> Staff\n'),
('claimacquisition','ACQCLAIM','Acquisition Claim','Item Not Received','<<aqbooksellers.name>>\r\n<<aqbooksellers.address1>>\r\n<<aqbooksellers.address2>>\r\n<<aqbooksellers.address3>>\r\n<<aqbooksellers.address4>>\r\n<<aqbooksellers.phone>>\r\n\r\n<order>Ordernumber <<aqorders.ordernumber>> (<<aqorders.title>>) (<<aqorders.quantity>> ordered) ($<<aqorders.listprice>> each) has not been received.</order>'),
('serial','RLIST','Routing List','Serial is now available','<<borrowers.firstname>> <<borrowers.surname>>,\r\n\r\nThe following issue is now available:\r\n\r\n<<biblio.title>>, <<biblio.author>> (<<items.barcode>>)\r\n\r\nPlease pick it up at your convenience.'),
('members','ACCTDETAILS','Account Details Template - DEFAULT','Your new Koha account details.','Hello <<borrowers.title>> <<borrowers.firstname>> <<borrowers.surname>>.\r\n\r\nYour new Koha account details are:\r\n\r\nUser:  <<borrowers.userid>>\r\nPassword: <<borrowers.password>>\r\n\r\nIf you have any problems or questions regarding your account, please contact your Koha Administrator.\r\n\r\nThank you,\r\nKoha Administrator\r\nkohaadmin@yoursite.org'), 
('circulation','DUE','Item Due Reminder','Item Due Reminder','Dear <<borrowers.firstname>> <<borrowers.surname>>,\r\n\r\nThe following item is now due:\r\n\r\n<<biblio.title>>, <<biblio.author>> (<<items.barcode>>)'), 
('circulation','DUEDGST','Item Due Reminder (Digest)','Item Due Reminder','You have <<count>> items due'), 
('circulation','PREDUE','Advance Notice of Item Due','Advance Notice of Item Due','Dear <<borrowers.firstname>> <<borrowers.surname>>,\r\n\r\nThe following item will be due soon:\r\n\r\n<<biblio.title>>, <<biblio.author>> (<<items.barcode>>)'), 
('circulation','PREDUEDGST','Advance Notice of Item Due (Digest)','Advance Notice of Item Due','You have <<count>> items due soon'),
('reserves', 'HOLD', 'Hold Available for Pickup', 'Hold Available for Pickup at <<branches.branchname>>', 'Dear <<borrowers.firstname>> <<borrowers.surname>>,\r\n\r\nYou have a hold available for pickup as of <<reserves.waitingdate>>:\r\n\r\nTitle: <<biblio.title>>\r\nAuthor: <<biblio.author>>\r\nCopy: <<items.copynumber>>\r\nLocation: <<branches.branchname>>\r\n<<branches.branchaddress1>>\r\n<<branches.branchaddress2>>\r\n<<branches.branchaddress3>>\r\n<<branches.branchcity>> <<branches.branchzip>>'),
('reserves', 'HOLD_PRINT', 'Hold Available for Pickup (print notice)', 'Hold Available for Pickup (print notice)', '<<branches.branchname>>\r\n<<branches.branchaddress1>>\r\n<<branches.branchaddress2>>\r\n\r\n\r\nChange Service Requested\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n<<borrowers.firstname>> <<borrowers.surname>>\r\n<<borrowers.address>>\r\n<<borrowers.city>> <<borrowers.zipcode>>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n<<borrowers.firstname>> <<borrowers.surname>> <<borrowers.cardnumber>>\r\n\r\nYou have a hold available for pickup as of <<reserves.waitingdate>>:\r\n\r\nTitle: <<biblio.title>>\r\nAuthor: <<biblio.author>>\r\nCopy: <<items.copynumber>>\r\n'),
('circulation','CHECKIN','Item Check-in (Digest)','Check-ins','The following items have been checked in:\r\n----\r\n<<biblio.title>>\r\n----\r\nThank you.'),
('circulation','CHECKOUT','Item Check-out (Digest)','Checkouts','The following items have been checked out:\r\n----\r\n<<biblio.title>>\r\n----\r\nThank you for visiting <<branches.branchname>>.'),
('reserves', 'HOLDPLACED', 'Hold Placed on Item', 'Hold Placed on Item','A hold has been placed on the following item : <<biblio.title>> (<<biblio.biblionumber>>) by the user <<borrowers.firstname>> <<borrowers.surname>> (<<borrowers.cardnumber>>).'),
('suggestions','ACCEPTED','Suggestion accepted', 'Purchase suggestion accepted','Dear <<borrowers.firstname>> <<borrowers.surname>>,\n\nYou have suggested that the library acquire <<suggestions.title>> by <<suggestions.author>>.\n\nThe library has reviewed your suggestion today. The item will be ordered as soon as possible. You will be notified by mail when the order is completed, and again when the item arrives at the library.\n\nIf you have any questions, please email us at <<branches.branchemail>>.\n\nThank you,\n\n<<branches.branchname>>'),
('suggestions','AVAILABLE','Suggestion available', 'Suggested purchase available','Dear <<borrowers.firstname>> <<borrowers.surname>>,\n\nYou have suggested that the library acquire <<suggestions.title>> by <<suggestions.author>>.\n\nWe are pleased to inform you that the item you requested is now part of the collection.\n\nIf you have any questions, please email us at <<branches.branchemail>>.\n\nThank you,\n\n<<branches.branchname>>'),
('suggestions','ORDERED','Suggestion ordered', 'Suggested item ordered','Dear <<borrowers.firstname>> <<borrowers.surname>>,\n\nYou have suggested that the library acquire <<suggestions.title>> by <<suggestions.author>>.\n\nWe are pleased to inform you that the item you requested has now been ordered. It should arrive soon, at which time it will be processed for addition into the collection.\n\nYou will be notified again when the book is available.\n\nIf you have any questions, please email us at <<branches.branchemail>>\n\nThank you,\n\n<<branches.branchname>>'),
('suggestions','REJECTED','Suggestion rejected', 'Purchase suggestion declined','Dear <<borrowers.firstname>> <<borrowers.surname>>,\n\nYou have suggested that the library acquire <<suggestions.title>> by <<suggestions.author>>.\n\nThe library has reviewed your request today, and has decided not to accept the suggestion at this time.\n\nThe reason given is: <<suggestions.reason>>\n\nIf you have any questions, please email us at <<branches.branchemail>>.\n\nThank you,\n\n<<branches.branchname>>');
INSERT INTO letter (module, code, name, title, content, is_html)
VALUES ('circulation','ISSUESLIP','Issue Slip','Issue Slip', '<h3><<branches.branchname>></h3>
Checked out to <<borrowers.title>> <<borrowers.firstname>> <<borrowers.initials>> <<borrowers.surname>> <br />
(<<borrowers.cardnumber>>) <br />

<<today>><br />

<h4>Checked Out</h4>
<checkedout>
<p>
<<biblio.title>> <br />
Barcode: <<items.barcode>><br />
Date due: <<issues.date_due>><br />
</p>
</checkedout>

<h4>Overdues</h4>
<overdue>
<p>
<<biblio.title>> <br />
Barcode: <<items.barcode>><br />
Date due: <<issues.date_due>><br />
</p>
</overdue>

<hr>

<h4 style="text-align: center; font-style:italic;">News</h4>
<news>
<div class="newsitem">
<h5 style="margin-bottom: 1px; margin-top: 1px"><b><<opac_news.title>></b></h5>
<p style="margin-bottom: 1px; margin-top: 1px"><<opac_news.new>></p>
<p class="newsfooter" style="font-size: 8pt; font-style:italic; margin-bottom: 1px; margin-top: 1px">Posted on <<opac_news.timestamp>></p>
<hr />
</div>
</news>', 1),
('circulation','ISSUEQSLIP','Issue Quick Slip','Issue Quick Slip', '<h3><<branches.branchname>></h3>
Checked out to <<borrowers.title>> <<borrowers.firstname>> <<borrowers.initials>> <<borrowers.surname>> <br />
(<<borrowers.cardnumber>>) <br />

<<today>><br />

<h4>Checked Out Today</h4>
<checkedout>
<p>
<<biblio.title>> <br />
Barcode: <<items.barcode>><br />
Date due: <<issues.date_due>><br />
</p>
</checkedout>', 1),
('circulation','RESERVESLIP','Reserve Slip','Reserve Slip', '<h5>Date: <<today>></h5>

<h3> Transfer to/Hold in <<branches.branchname>></h3>

<h3><<borrowers.surname>>, <<borrowers.firstname>></h3>

<ul>
    <li><<borrowers.cardnumber>></li>
    <li><<borrowers.phone>></li>
    <li> <<borrowers.address>><br />
         <<borrowers.address2>><br />
         <<borrowers.city >>  <<borrowers.zipcode>>
    </li>
    <li><<borrowers.email>></li>
</ul>
<br />
<h3>ITEM ON HOLD</h3>
<h4><<biblio.title>></h4>
<h5><<biblio.author>></h5>
<ul>
   <li><<items.barcode>></li>
   <li><<items.itemcallnumber>></li>
   <li><<reserves.waitingdate>></li>
</ul>
<p>Notes:
<pre><<reserves.reservenotes>></pre>
</p>
', 1),
('circulation','TRANSFERSLIP','Transfer Slip','Transfer Slip', '<h5>Date: <<today>></h5>

<h3>Transfer to <<branches.branchname>></h3>

<h3>ITEM</h3>
<h4><<biblio.title>></h4>
<h5><<biblio.author>></h5>
<ul>
   <li><<items.barcode>></li>
   <li><<items.itemcallnumber>></li>
</ul>', 1);