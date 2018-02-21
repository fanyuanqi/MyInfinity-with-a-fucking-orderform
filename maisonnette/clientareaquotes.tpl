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
{include file="$template/includes/tablelist.tpl" tableName="QuotesList"  noSortColumns="5" filterColumn="4"}
<script type="text/javascript">
    jQuery(document).ready( function ()
    {
        var table = jQuery('#tableQuotesList').removeClass('hidden').css('width','100%').DataTable();
        {if $orderby == 'id'}
            table.order(0, '{$sort}');
        {elseif $orderby == 'date'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'validuntil'}
            table.order(3, '{$sort}');
        {elseif $orderby == 'stage'}
            table.order(4, '{$sort}');
        {/if}
        table.draw();
        jQuery('#tableLoading').addClass('hidden');
    });
</script>
<div class="table-container clearfix">
    <table id="tableQuotesList" class="table able-striped table-hover table-list hidden">
	    <colgroup>
            <col style="width:15%">
            <col style="width:15%">
            <col style="width:15%">
            <col style="width:15%">
            <col style="width:15%">
            <col style="width:15%">
        </colgroup> 
        <thead>
            <tr>
                <th><div>{$LANG.quotenumber}</div></th>
                <th><div>{$LANG.quotesubject}</div></th>
                <th><div>{$LANG.quotedatecreated}</div></th>
                <th><div>{$LANG.quotevaliduntil}</div></th>
                <th><div>{$LANG.quotestage}</div></th>
                <th><div>&nbsp;</div></th>
                <th class="responsive-edit-button" style="display: none;"></th>
            </tr>
        </thead>
        <tbody>
            {foreach from=$quotes item=quote}
                <tr onclick="clickableSafeRedirect(event, 'viewquote.php?id={$quote.id}', true)">
                    <td>{$quote.id}</td>
                    <td>{$quote.subject}</td>
                    <td><span class="hidden">{$quote.normalisedDateCreated}</span>{$quote.datecreated}</td>
                    <td><span class="hidden">{$quote.normalisedValidUntil}</span>{$quote.validuntil}</td>
                    <td><span class="label status status-{$quote.stageClass}">{$quote.stage}</span></td>
                    <td class="text-center">
                        <form method="submit" action="dl.php">
                            <input type="hidden" name="type" value="q" />
                            <input type="hidden" name="id" value="{$quote.id}" />
                            <button type="submit" class="btn btn-default btn-sm"><i class="fa fa-download"></i> {$LANG.quotedownload}</button>
                        </form>
                    </td>
                    <td class="responsive-edit-button" style="display: none;">
                        <a href="viewquote.php?id={$quote.id}" class="btn btn-block btn-info">
                            {$LANG.manageproduct}
                        </a>
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
