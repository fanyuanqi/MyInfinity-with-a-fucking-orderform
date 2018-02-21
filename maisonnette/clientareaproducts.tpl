<div class="main-content container">
<div class="row">
	<div class="col-sm-12">
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				{$LANG.clientareaproducts}
				<div class="tools">
					<span class="icon s7-cloud-download"></span>
				</div>
			</div>
			<div class="panel-body">

{include file="$template/includes/tablelist.tpl" tableName="ServicesList" filterColumn="3"}
<script type="text/javascript">
    jQuery(document).ready( function ()
    {
        var table = jQuery('#tableServicesList').removeClass('hidden').css('width','100%').DataTable();
        {if $orderby == 'product'}
            table.order([0, '{$sort}'], [3, 'asc']);
        {elseif $orderby == 'amount' || $orderby == 'billingcycle'}
            table.order(1, '{$sort}');
        {elseif $orderby == 'nextduedate'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'domainstatus'}
            table.order(3, '{$sort}');
        {/if}
        table.draw();
        jQuery('#tableLoading').addClass('hidden');
    });
</script>

    <table id="tableServicesList" class="table table-striped table-hover hidden">
		<colgroup>
            <col style="width:40%">
            <col style="width:15%">
            <col style="width:15%">
            <col style="width:15%"> 
            <col style="width:10%">
            <col style="width:0%">
        </colgroup>
        <thead>
            <tr>
                <th><div>{$LANG.orderproduct}</div></th>
                <th><div>{$LANG.clientareaaddonpricing}</div></th>
                <th><div>{$LANG.orderbillingcycle}</div></th>
                <th><div>{$LANG.clientareahostingnextduedate}</div></th>
                <th><div>{$LANG.clientareastatus}</div></th>
            </tr>
        </thead>
        <tbody>
            {foreach key=num item=service from=$services}
            <tr onclick="clickableSafeRedirect(event, 'clientarea.php?action=productdetails&amp;id={$service.id}', false)">
                <td><b>{$service.product}</b>{if $service.domain}<br /><a href="http://{$service.domain}" target="_blank">{$service.domain}</a>{/if}</td>
                <td data-order="{$service.amountnum}">{$service.amount}</td>
                <td>{$service.billingcycle}</td>
                <td>
                    {if $service.nextduedate != '-'}
                    <span class="hidden">{$service.normalisedNextDueDate}</span>{$service.nextduedate}
                    {else}
                    	永久
                    {/if}
                </td>
                <td class="cell-status">
	                <span class="label label-simple label-{$service.status|strtolower}">{$service.statustext}</span>
	            </td>
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
