{include file="./header.tpl"}
<div class="main-content container">
	<div class="row invoice">
	    <div class="col-sm-3 invoice-aside">
	        {if $logo}
	            <p style="margin-bottom: 110px;"><img src="{$logo}" title="{$companyname}" /></p>
	        {else}
	            <h2 style="margin-bottom: 110px;">{$companyname}</h2>
	        {/if}
	        <div class="invoice-data">
	            <div class="invoice-person">
	                <span class="name">{$clientsdetails.firstname} {$clientsdetails.lastname}</span>
		            {if $clientsdetails.companyname}<span>{$clientsdetails.companyname}</span>{/if}
	                <span>{$clientsdetails.address1}, {$clientsdetails.address2}</span>
	                <span>{$clientsdetails.city}, {$clientsdetails.state}, {$clientsdetails.postcode}</span>
	                <span>{$clientsdetails.country}</span>
	                {if $customfields}
	                <br />
	                <br />
	                {foreach from=$customfields item=customfield}
	                {$customfield.fieldname}: {$customfield.value}<br />
	                {/foreach}
	                {/if}
		        </div>
	            <div class="invoice-payment-direction">
		            <i class="icon s7-angle-down-circle"></i>
		        </div>
	            <div class="invoice-person">
		            {$payto}
		        </div>
		        <div class="invoice-company-info">
	            	<b>{$LANG.paymentmethod}:</b>
			      	{if $status eq "Unpaid" && $allowchangegateway}
	                    <form method="post" action="{$smarty.server.PHP_SELF}?id={$invoiceid}">
	                        {$gatewaydropdown}
	                    </form>
	                {else}
	                    {$paymentmethod}
	                {/if}
			        {if $status eq "Unpaid" || $status eq "Draft"}
	                    <span class="payment-btn-container hidden-print" align="center">
	                        {$paymentbutton}
	                    </span>
	                {/if}
		        </div>
	        </div>
	    </div>
	    <div class="col-sm-9 invoice-content">
	        <div class="row invoice-header">
	            <div class="col-6 invoice-title">
		            {if $status eq "Draft"}
		                <span class="draft">{$LANG.invoicesdraft}</span>
		            {elseif $status eq "Unpaid"}
		                <span class="unpaid">{$LANG.invoicesunpaid}</span>
		            {elseif $status eq "Paid"}
		                <span class="paid">{$LANG.invoicespaid}</span>
		            {elseif $status eq "Refunded"}
		                <span class="refunded">{$LANG.invoicesrefunded}</span>
		            {elseif $status eq "Cancelled"}
		                <span class="cancelled">{$LANG.invoicescancelled}</span>
		            {elseif $status eq "Collections"}
		                <span class="collections">{$LANG.invoicescollections}</span>
		            {elseif $status eq "Payment Pending"}
		                <span class="paid">{$LANG.invoicesPaymentPending}</span>
		            {/if}
		        </div>
	            <div class="col-6 invoice-order">
		            <span class="invoice-number">{$pagetitle}</span>
		            <span class="invoice-date" style="display: block;">
		            	{$LANG.invoicesdatecreated}: {$date}
		            </span>
		            {if $status eq "Unpaid" || $status eq "Draft"}
	                    <span class="invoice-date">
	                        {$LANG.invoicesdatedue}: {$datedue}
	                    </span>
	                {/if}
		        </div>
	        </div>
	        {if $paymentSuccessAwaitingNotification}
	            {include file="$template/includes/panel.tpl" type="success" headerTitle=$LANG.success bodyContent=$LANG.invoicePaymentSuccessAwaitingNotify bodyTextCenter=true}
	        {elseif $paymentSuccess}
	            {include file="$template/includes/panel.tpl" type="success" headerTitle=$LANG.success bodyContent=$LANG.invoicepaymentsuccessconfirmation bodyTextCenter=true}
	        {elseif $pendingReview}
	            {include file="$template/includes/panel.tpl" type="info" headerTitle=$LANG.success bodyContent=$LANG.invoicepaymentpendingreview bodyTextCenter=true}
	        {elseif $paymentFailed}
	            {include file="$template/includes/panel.tpl" type="danger" headerTitle=$LANG.error bodyContent=$LANG.invoicepaymentfailedconfirmation bodyTextCenter=true}
	        {elseif $offlineReview}
	            {include file="$template/includes/panel.tpl" type="info" headerTitle=$LANG.success bodyContent=$LANG.invoiceofflinepaid bodyTextCenter=true}
	        {/if}
	        {if $manualapplycredit}
	            <div class="panel panel-success">
	                <div class="panel-heading">
	                    <h3 class="panel-title"><strong>{$LANG.invoiceaddcreditapply}</strong></h3>
	                </div>
	                <div class="panel-body">
	                    <form method="post" action="{$smarty.server.PHP_SELF}?id={$invoiceid}">
	                        <input type="hidden" name="applycredit" value="true" />
	                        {$LANG.invoiceaddcreditdesc1} <strong>{$totalcredit}</strong>. {$LANG.invoiceaddcreditdesc2}. {$LANG.invoiceaddcreditamount}:
	                        <div class="row">
	                            <div class="col-xs-8 col-xs-offset-2 col-sm-4 col-sm-offset-4">
	                                <div class="input-group">
	                                    <input type="text" name="creditamount" value="{$creditamount}" class="form-control" />
	                                    <span class="input-group-btn">
	                                        <input type="submit" value="{$LANG.invoiceaddcreditapply}" class="btn btn-success" />
	                                    </span>
	                                </div>
	                            </div>
	                        </div>
	                    </form>
	                </div>
	            </div>
	        {/if}
	
	        {if $notes}
	            {include file="$template/includes/panel.tpl" type="info" headerTitle=$LANG.invoicesnotes bodyContent=$notes}
	        {/if}
	        
	        <div class="row">
	            <div class="col-md-12">
	                <table class="invoice-details">
	                	<thead>
	                    	<tr>
								<th style="width:60%">{$LANG.invoicesdescription}</th>
								<th style="width:15%" class="amount">{$LANG.invoicesamount}</th>
	                    	</tr>
	                    </thead>
						<tbody>
							{foreach from=$invoiceitems item=item}
							    <tr>
							        <td class="description">{$item.description}{if $item.taxed eq "true"} *{/if}</td>
							        <td class="amount">{$item.amount}</td>
							    </tr>
							{/foreach}
	                	</tbody>
	                </table>
	                <table class="invoice-summary">
	                	<thead>
	                    	<tr>
								<th>{$LANG.invoicessubtotal}</th>
								<th>{$LANG.invoicescredit}</th>
								<th class="total">{$LANG.invoicestotal}</th>
	                    	</tr>
	                	</thead>
	                	<tbody>
	                    	<tr>
								<td class="amount">{$subtotal}</td>
								<td class="amount">{$credit}</td>
								<td class="amount total-value">{$total}</td>
	                    	</tr>
	                	</tbody>
	                </table>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-12 invoice-message mt-5 mb-5 mt-sm-6 mb-sm-6">
		            {if $taxrate}
	                	<p>* {$LANG.invoicestaxindicator}</p>
					{/if}
	            </div>
	            <div class="col-md-12">
		            <div class="transactions-container small-text">
		                <div class="table-responsive">
		                    <table class="table table-condensed">
		                        <thead>
		                            <tr>
		                                <td class="text-center"><strong>{$LANG.invoicestransdate}</strong></td>
		                                <td class="text-center"><strong>{$LANG.invoicestransgateway}</strong></td>
		                                <td class="text-center"><strong>{$LANG.invoicestransid}</strong></td>
		                                <td class="text-center"><strong>{$LANG.invoicestransamount}</strong></td>
		                            </tr>
		                        </thead>
		                        <tbody>
		                            {foreach from=$transactions item=transaction}
		                                <tr>
		                                    <td class="text-center">{$transaction.date}</td>
		                                    <td class="text-center">{$transaction.gateway}</td>
		                                    <td class="text-center">{$transaction.transid}</td>
		                                    <td class="text-center">{$transaction.amount}</td>
		                                </tr>
		                            {foreachelse}
		                                <tr>
		                                    <td class="text-center" colspan="4">{$LANG.invoicestransnonefound}</td>
		                                </tr>
		                            {/foreach}
		                            <tr>
		                                <td class="text-right" colspan="3"><strong>{$LANG.invoicesbalance}</strong></td>
		                                <td class="text-center">{$balance}</td>
		                            </tr>
		                        </tbody>
		                    </table>
		                </div>
		            </div>
	            </div>
	        </div>
	        <div class="row invoice-footer">
	            <div class="col-md-12">
		            <a href="javascript:window.print()" class="btn btn-space btn-secondary"><i class="fa fa-print"></i> {$LANG.print}</a>
	                <a href="dl.php?type=i&amp;id={$invoiceid}" class="btn btn-space btn-secondary"><i class="fa fa-download"></i> {$LANG.invoicesdownload}</a>
	            </div>
	        </div>
	    </div>
	</div>
</div>
{include file="./footer.tpl"}