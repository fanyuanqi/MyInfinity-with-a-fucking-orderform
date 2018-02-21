<div class="widget widget-fullwidth earnings">
    <div class="widget-head">
        <span class="title">待支付账单</span>
    </div>
	<div class="panel-cards{if $invoices|@count > 4} cards-carousel{/if}">
		{if $invoices}
		<ul class="cards">
			<li>
			{foreach from=$invoices item=invoice key=i}
				<a class="card-row" href="viewinvoice.php?id={$invoice.id}">
					<span class="cell-title">#{$invoice.invoicenum}</span>
					<span class="cell-date" style="float: left"><span class="text-muted">{$LANG.nextdue}: </span>{$invoice.datedue}</span>
					<span class="cell-total"><span class="price text-danger">{$invoice.total}</span></span>
				</a>
				{if $invoices|@count != ($i+1)}
					{if ($i+1) % 4 == 0}</li><li>{/if}
				{/if}
			{/foreach}
		</ul>
		<div class="cards-nav" style="display: none;">
			{if $invoices|@count > 4}<button class="card-prev btn btn-default btn-icon btn-link pull-left" type="button"><i class="zmdi zmdi-long-arrow-left"></i></button>{/if}
			<span class="card-number"><b class="number-current">{if $invoices|@count > 4}4{else}{$invoices|@count}{/if}</b>/<span class="number-total">{$invoices|@count}</span></span>
			{if $invoices|@count > 4}<button class="card-next btn btn-default btn-icon btn-link pull-right" type="button"><i class="zmdi zmdi-long-arrow-right"></i></button>{/if}
		</div>
		{else}
		<div class="no-data">
			<div class="no-data-slogan">
				<div class="icon-holder">
					<i class="s7-file"></i>
					<div class="circle">
						<i class="s7-close"></i>
					</div>
				</div>
				<span>你还没有任何账单</span>
			</div>
		</div>
		{/if}
	</div>
</div>
