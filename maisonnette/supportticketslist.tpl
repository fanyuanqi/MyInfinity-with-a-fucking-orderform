<div class="main-content container">
<div class="row">
	<div class="col-sm-12">
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				{$LANG.navtickets}
				<div class="tools">
					<span class="icon s7-cloud-download"></span>
				</div>
			</div>
			<div class="panel-body">
{include file="$template/includes/tablelist.tpl" tableName="TicketsList" filterColumn="2"}
<script type="text/javascript">
    jQuery(document).ready( function ()
    {
        var table = jQuery('#tableTicketsList').removeClass('hidden').css('width','100%').DataTable();
        {if $orderby == 'did' || $orderby == 'dept'}
            table.order(0, '{$sort}');
        {elseif $orderby == 'subject' || $orderby == 'title'}
            table.order(1, '{$sort}');
        {elseif $orderby == 'status'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'lastreply'}
            table.order(3, '{$sort}');
        {/if}
        table.draw();
        jQuery('#tableLoading').addClass('hidden');
    });
</script>
<div class="table-container clearfix">
    <table id="tableTicketsList" class="table table-list hidden">
		<colgroup>
			<col style="width:40%">
			<col style="width:20%">
			<col style="width:20%">
			<col style="width:10%">
		</colgroup>
        <thead>
            <tr>
				<th><div>{$LANG.supportticketssubject}</div></th>
				<th class="hidden-sm"><div>{$LANG.supportticketsdepartment}</div></th>
				<th><div>{$LANG.supportticketsticketlastupdated}</div></th>
				<th><div>{$LANG.supportticketsstatus}</div></th>
            </tr>
        </thead>
        <tbody>
            {foreach from=$tickets item=ticket}
                <tr onclick="window.location='viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}'">
                    <td class="cell-title">{if $ticket.unread}<strong>{/if}<b>#{$ticket.tid}</b> - {$ticket.subject}{if $ticket.unread}</strong>{/if}</td>
					<td class="hidden-sm hidden-xs">{$ticket.department}</td>
					<td class="cell-date" data-order="{$ticket.normalisedLastReply}">{$ticket.lastreply}</td>
					<td class="cell-status"><span class="label label-simple label-{$ticket.statusClass}">{$ticket.status|strip_tags:false}</span></td>

                </tr>
            {/foreach}
        </tbody>
    </table>
    <div class="text-center" id="tableLoading">
        <p><i class="icon s7-refresh-2"></i> {$LANG.loading}</p>
    </div>
			</div>
		</div>
	</div>
</div>
