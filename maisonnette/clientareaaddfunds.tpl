<div class="main-content container">
<div class="row">
	<div class="col-md-4">
		<!--Account Start-->
		{include file="$template/includes/dashboard/widget-account.tpl"}
		<!--Account End-->
	</div>
	<div class="col-md-8">
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="title">{$displayTitle}</span>
			</div>
			<div class="panel-body">
				{if $addfundsdisabled}
				    {include file="$template/includes/alert.tpl" type="error" msg=$LANG.clientareaaddfundsdisabled textcenter=true}
				{elseif $notallowed}
				    {include file="$template/includes/alert.tpl" type="error" msg=$LANG.clientareaaddfundsnotallowed textcenter=true}
				{elseif $errormessage}
				    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage textcenter=true}
				{/if}
				
				{if !$addfundsdisabled}
				
				    <div class="row">
				
				        <div class="col-sm-10">
		                    <form method="post" action="{$smarty.server.PHP_SELF}?action=addfunds">
		                        <fieldset>
		                            <div class="form-group">
		                                <label for="amount" class="control-label">{$LANG.addfundsamount}:</label>
		                                <input type="text" name="amount" id="amount"
		                                       value="{$amount}" class="form-control" required />
		                            </div>
		                            <div class="form-group">
		                                <label for="paymentmethod" class="control-label">{$LANG.orderpaymentmethod}:</label>
		                                <input type="hidden" name="paymentmethod">
		                                <ul class="list-unstyled row">
		                                    {foreach from=$gateways item=gateway}
		                                        <li class="col-sm-3 pay_method text-center">
		                                        	<a class="{$gateway.sysname}" data-type="{$gateway.sysname}">
			                                        	<div class="icon"></div>
			                                        	<span class="name">{$gateway.name}</span>
		                                        	</a>
		                                        </li>
		                                    {/foreach}
		                                </ul>
		                            </div>
					                <p class="text-success ">{$LANG.addfundsnonrefundable}</p>
		                            <div class="form-group">
		                                <input type="submit" value="{$LANG.addfunds}" class="btn btn-primary btn-lg" />
		                            </div>
		                        </fieldset>
		                    </form>
				        </div>
				
				        <div class="col-sm-12">
				            <div class="panel">
				                <table class="table table-striped">
				                    <tbody>
				                    <tr>
				                        <td class="textright"><strong>{$LANG.addfundsminimum}</strong></td>
				                        <td>{$minimumamount}</td>
				                    </tr>
				                    <tr>
				                        <td class="textright"><strong>{$LANG.addfundsmaximum}</strong></td>
				                        <td>{$maximumamount}</td>
				                    </tr>
				                    <tr>
				                        <td class="textright"><strong>{$LANG.addfundsmaximumbalance}</strong></td>
				                        <td>{$maximumbalance}</td>
				                    </tr>
				                    </tbody>
				                </table>
				            </div>
				        </div>
				
				    </div>
				
				{/if}
			</div>
		</div>

	</div>
	
</div>
<script type="text/javascript">
  $(function(){
      $('.pay_method').click(function(){
        var payway=$(this).find('a').data('type');
        $("input[name='paymentmethod']").val(payway);
        $(this).siblings('li').find('a').css('border-color','#f2f2f2');
        $(this).find('a').css('border-color','#46be8a');
      });
  });
</script>