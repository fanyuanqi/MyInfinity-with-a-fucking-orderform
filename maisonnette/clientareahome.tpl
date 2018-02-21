<div class="main-content container">
<div class="client-home-panels">
	
	<div class="row">
		<div class="col-md-4">
			<!--Account Start-->
			{include file="$template/includes/dashboard/widget-account.tpl"}
			<!--Account End-->
		</div>
		<div class="col-md-4">
		{if $addons_html['0']['ssinfo']}
			<!--Shadowsock Start-->
			{include file="$template/includes/dashboard/widget-shadowsock.tpl"}
			<!--Shadowsock End-->
			{else}
			{include file="$template/includes/dashboard/widget-ann.tpl"}
		{/if}
		</div>
	    <div class="col-md-4">
			<!--Status Start-->
			{include file="$template/includes/dashboard/widget-status.tpl"}
			<!--Status End-->
	    </div>
		    
		<div class="col-md-4">
			<!--Products Start-->
			{include file="$template/includes/dashboard/widget-products.tpl"}
			<!--Products End-->
		</div>
		<div class="col-md-4">
			<!--Tickets Start-->
			{include file="$template/includes/dashboard/widget-tickets.tpl"}
			<!--Tickets End-->
		</div>
		<div class="col-md-4">
			{if $addons_html['0']['ssinfo']}
			<!--Ann Start-->
			{include file="$template/includes/dashboard/widget-ann.tpl"}
			<!--Ann End-->
			{else}
			<!--Invoices Start-->
			{include file="$template/includes/dashboard/widget-invoices.tpl"}
			<!--Invoices End-->
			{/if}
		</div>
    </div>
    
</div>