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
{include file="$template/includes/tablelist.tpl" tableName="InvoicesList" filterColumn="4"}
<script type="text/javascript">
    jQuery(document).ready( function ()
    {
        var table = jQuery('#tableInvoicesList').removeClass('hidden').css('width','100%').DataTable();
        {if $orderby == 'default'}
            table.order([4, 'desc'], [2, 'asc']);
        {elseif $orderby == 'invoicenum'}
            table.order(0, '{$sort}');
        {elseif $orderby == 'date'}
            table.order(1, '{$sort}');
        {elseif $orderby == 'duedate'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'total'}
            table.order(3, '{$sort}');
        {elseif $orderby == 'status'}
            table.order(4, '{$sort}');
        {/if}
        table.draw();
        jQuery('#tableLoading').addClass('hidden');
    });
</script>

    <table id="tableInvoicesList" class="table table-striped table-hover hidden">
	    <colgroup>
            <col style="width:20%">
            <col style="width:20%">
            <col style="width:20%">
            <col style="width:20%">
            <col style="width:10%">
        </colgroup> 
        <thead>
            <tr>
                <th><div>{$LANG.invoicestitle}</div></th>
                <th><div>{$LANG.invoicesdatecreated}</div></th>
                <th><div>{$LANG.invoicesdatedue}</div></th>
                <th><div>{$LANG.invoicestotal}</div></th>
                <th><div>{$LANG.invoicesstatus}</div></th>
            </tr>
        </thead>
        <tbody>
            {foreach key=num item=invoice from=$invoices}
                <tr onclick="clickableSafeRedirect(event, 'viewinvoice.php?id={$invoice.id}', false)">
                    <td class="cell-title" data-order="{$invoice.invoicenumraw}">{$invoice.invoicenum}</td>
                    <td class="hidden-xs" data-order="{$invoice.normalisedDateCreated}"><span class="hidden">{$invoice.normalisedDateCreated}</span>{$invoice.datecreated}</td>
                    <td class="cell-date" data-order="{$invoice.normalisedDateDue}"><span class="hidden">{$invoice.normalisedDateDue}</span>{$invoice.datedue}</td>
                    <td data-order="{$invoice.totalnum}">{$invoice.total}</td>
                    <td class="cell-status"><span class="label label-simple label-{$invoice.statusClass}">{$invoice.status}</span></td>
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
