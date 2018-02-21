<div class="widget widget-fullwidth earnings">
    <div class="widget-head">
        <span class="title">激活的工单</span>
    </div>
	<div class="panel-cards{if $tickets|@count > 4} cards-carousel{/if}">
	{if $tickets}
		<ul class="cards">
			<li>
			{foreach from=$tickets item=ticket key=i}
				<a class="card-row" href="viewticket.php?tid={$ticket.tid}&c={$ticket.c}">
					<span class="cell-title">{if $ticket.unread}<strong>{/if}<b>#{$ticket.tid}</b> - {$ticket.subject}{if $ticket.unread}</strong>{/if}</span>
					<span class="cell-status"><span class="label label-simple label-{$ticket.statusClass}">{$ticket.status|strip_tags:false}</span></span>
					<span class="cell-date"><span class="text-muted">更新时间: </span>{$ticket.lastreply}</td>
				</a>
			{if $tickets|@count != ($i+1)}
			{if ($i+1) % 4 == 0}</li><li>{/if}
			{/if}
			{/foreach}
		</ul>
		<div class="cards-nav">
			{if $tickets|@count > 4}<button class="card-prev btn btn-default btn-icon btn-link pull-left" type="button"><i class="zmdi zmdi-long-arrow-left"></i></button>{/if}
			<span class="card-number"><b class="number-current">{if $tickets|@count > 4}4{else}{$tickets|@count}{/if}</b>/<span class="number-total">{$tickets|@count}</span></span>
			{if $tickets|@count > 4}<button class="card-next btn btn-default btn-icon btn-link pull-right"><i class="zmdi zmdi-long-arrow-right"></i></button>{/if}
		</div>
	{else}
		<div class="no-data no-data-xs">
			<div class="no-data-slogan">
				<div class="icon-holder">
					<i class="s7-file"></i>
					<div class="circle">
						<i class="s7-close"></i>
					</div>
				</div>
				<span>还没有任何激活的工单!</span>
			</div>
		</div>
	{/if}
	</div>
</div>
