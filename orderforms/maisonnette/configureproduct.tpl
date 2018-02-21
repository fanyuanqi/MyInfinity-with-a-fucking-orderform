{include file="orderforms/{$carttpl}/common.tpl"}

<script>
var _localLang = {
    'addToCart': '{$LANG.orderForm.addToCart|escape}',
    'addedToCartRemove': '{$LANG.orderForm.addedToCartRemove|escape}'
}
jQuery(function () {
	jQuery(".order-list > div").click(function(){
		value = jQuery(this).data('cycle');
		jQuery(this).addClass("selected").find('input[type=radio]').attr("checked","checked");
		jQuery(this).siblings().removeClass("selected").find('input[type=radio]').removeAttr("checked");
		jQuery("#inputBillingcycle").val(value);
		jQuery('#orderSummaryLoader').removeClass('hidden');
		{if $configurableoptions}updateConfigurableOptions({$i}, value);{else}recalctotals();{/if}
	});
	jQuery(".bk-group-detail .row > div").click(function () {
        jQuery(this).addClass("selected").find('input[type=radio]').attr("checked", "checked");
		jQuery(this).siblings().removeClass("selected").find('input[type=radio]').removeAttr("checked");
		jQuery('#orderSummaryLoader').removeClass('hidden');
		recalctotals();
    });
    jQuery("input[name=hostname]").val("NeWorld-"+(new Date()).getFullYear()+((new Date()).getMonth()+1).toString()+(new Date()).getDate()+parseInt(Math.random()*(999+1),10));
});
</script>

<!-- NAV START -->
{include file="orderforms/{$carttpl}/nav-top.tpl" step="2"}
<!-- NAV END -->

	<div class="title-heads">
	    <h1>{$LANG.orderconfigure}</h1>
		<p class="lead">{$LANG.orderForm.configureDesiredOptions}</p>
	</div>


<div id="order-standard_cart" class="sidebar-right space">

    <form id="frmConfigureProduct">
    <input type="hidden" name="configure" value="true" />
    <input type="hidden" name="i" value="{$i}" />
	<div class="container" style="position: relative;">

            
        <div class="content-body">
            
            <div class="panel panel-order">
	            <div class="panel-header">
	                <div class="header-title">
	                    <h6>{$LANG.orderconfigure} {$productinfo.name}</h6>
	                    <!-- {$productinfo.description} -->
	                </div>
	            </div>
	            <div class="panel-body">
	
	                {if $configurableoptions}
	                    <h5 class="line">
		                    <i class="bk-group-title-icon icon-buy-storage"></i>
							{$LANG.orderconfigpackage}
						</h5>
						
	                    <div class="product-configurable-options" id="productConfigurableOptions">
	                        <div class="row">
	                            {foreach $configurableoptions as $num => $configoption}
	                                {if $configoption.optiontype eq 1}
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <label for="inputConfigOption{$configoption.id}">{$configoption.optionname}</label>
	                                            <select name="configoption[{$configoption.id}]" id="inputConfigOption{$configoption.id}" class="form-control">
	                                                {foreach key=num2 item=options from=$configoption.options}
	                                                    <option value="{$options.id}"{if $configoption.selectedvalue eq $options.id} selected="selected"{/if}>
	                                                        {$options.name}
	                                                    </option>
	                                                {/foreach}
	                                            </select>
	                                        </div>
	                                    </div>
	                                {elseif $configoption.optiontype eq 2}
										<div class="col-sm-12" id="{$configoption.id}">
	                                        <h5 class="line">
	                                            {$configoption.optionname}
	                                        </h5>
	                                        <div class="bk-group-detail {if $configoption.optionname == '镜像'}system{/if}">
	                                            <div class="row">
	                                                {foreach key=num2 item=options from=$configoption.options}
	                                                <div class="col-sm-3 {if $configoption.selectedvalue eq $options.id} selected{/if}">
	                                                <input type="radio" name="configoption[{$configoption.id}]" value="{$options.id}"{if $configoption.selectedvalue eq $options.id} checked="checked"{/if} />
	                                                    <div class="panel panel-default">
	                                                        <div class="panel-body text-center">
	                                                        {if $options.name}
	                                                        	{if $configoption.optionname == '镜像'}
						                                        	{assign var=value value=" "|explode:$options.name}
				                                                	<i class="alico icon-os-{$value[0]|lower}"></i>
	                                                            	<span>
	                                                            	{$value[1]} {$value[2]}
				                                                	</span>
				                                                {else}
						                                        	{assign var=value value=" "|explode:$options.name}
						                                        	<span data-price="{$value[1]}">{$value[0]}</span>
				                                                {/if}
	                                                        {else}
	                                                            {$LANG.enable}
	                                                        {/if}
	                                                        </div>
	                                                    </div>
	                                                </div>
	                                                {/foreach}
	                                            </div>
	                                        </div>
										</div>
	                                {elseif $configoption.optiontype eq 3}
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <label for="inputConfigOption{$configoption.id}">{$configoption.optionname}</label>
	                                            <br />
	                                            <label>
	                                                <input type="checkbox" name="configoption[{$configoption.id}]" id="inputConfigOption{$configoption.id}" value="1"{if $configoption.selectedqty} checked{/if} />
	                                                {if $configoption.options.0.name}
	                                                    {$configoption.options.0.name}
	                                                {else}
	                                                    {$LANG.enable}
	                                                {/if}
	                                            </label>
	                                        </div>
	                                    </div>
	                                {elseif $configoption.optiontype eq 4}
	                                    <div class="col-sm-12">
                                            <dl class="bk-group group{$configoption.id}">
                                                <dt class="bk-group-title">
													<span>{$configoption.optionname}</span>
												</dt>
                                                <dd class="bk-group-detail">
                                                <div class="row">
                                                    <div class="col-sm-12" style="padding: 0 20px;">
                                                {if $configoption.qtymaximum}
                                                    {if !$rangesliderincluded}
                                                        <script type="text/javascript" src="{$BASE_PATH_JS}/ion.rangeSlider.min.js"></script>
                                                        <link href="{$BASE_PATH_CSS}/ion.rangeSlider.css" rel="stylesheet">
                                                        <link href="{$BASE_PATH_CSS}/ion.rangeSlider.skinModern.css" rel="stylesheet">
                                                        {assign var='rangesliderincluded' value=true}
                                                    {/if}
                                                    <input type="text" name="configoption[{$configoption.id}]" value="{if $configoption.selectedqty}{$configoption.selectedqty}{else}{$configoption.qtyminimum}{/if}" id="inputConfigOption{$configoption.id}" class="form-control js-rangeslider" />
                                                    <script>
                                                        var sliderTimeoutId = null;

                                                        jQuery("#inputConfigOption{$configoption.id}").ionRangeSlider({
                                                            min: {$configoption.qtyminimum},
                                                            max: {$configoption.qtymaximum},
                                                            grid: true,
                                                            grid_snap: true,
                                                            step: 100,
                                                            {if $configoption.optionname == '储存'}
                                                            postfix: ' GB',
                                                            {else}
                                                            postfix: ' MB',
                                                            {/if}
                                                            onChange: function() {
                                                                if (sliderTimeoutId) {
                                                                    clearTimeout(sliderTimeoutId);
                                                                }

                                                                sliderTimeoutId = setTimeout(function() {
                                                                    sliderTimeoutId = null;
                                                                    recalctotals();
                                                                }, 250);
                                                            }
                                                        });
                                                    </script>

                                                {else}
                                                    <div>
                                                        <input type="number" name="configoption[{$configoption.id}]" value="{if $configoption.selectedqty}{$configoption.selectedqty}{else}{$configoption.qtyminimum}{/if}" id="inputConfigOption{$configoption.id}" min="{$configoption.qtyminimum}" onchange="recalctotals()" onkeyup="recalctotals()" class="form-control form-control-qty" />
                                                        <span class="form-control-static form-control-static-inline">
                                                            x {$configoption.options.0.name}
                                                        </span>
                                                    </div>
                                                {/if}
                                                    </div>
                                                </div>
                                                </dd>
                                            </dl>
                                        </div>
	                                {/if}
	                                {if $num % 2 != 0}
	                                    </div>
	                                    <div class="row">
	                                {/if}
	                            {/foreach}
	                        </div>
	                    </div>
	
	                {/if}

                    {if $productinfo.type eq "server"}
								
						<h5 class="line">
							<i class="bk-group-title-icon icon-buy-security"></i>
							{$LANG.cartconfigserver}
						</h5>
						
                        <dl class="bk-group">
                            <dd class="bk-group-detail">
	                            <div class="row">
	                                <div class="col-sm-12">
	                                    <div class="bk-form-row">
	                                        <label for="inputRootpw" class="bk-form-row-name">{$LANG.orderserverrootpassword}</label>
	                                        <div class="bk-form-row-cell">
	                                        	<input type="password" name="rootpw" class="bk-form-input" id="inputRootpw" value="{$server.rootpw}">
	                                        	<span class="bk-form-row-li-info bk-ml2" ng-if="tip" ng-bind="tip">8 - 30 个字符，且同时包含三项（大写字母，小写字母，数字和特殊符号） </span>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-12">
	                                    <div class="bk-form-row">
	                                        <label for="inputHostname" class="bk-form-row-name">{$LANG.orderserverhostname}</label>
	                                        <div class="bk-form-row-cell">
	                                        	<input type="text" name="hostname" class="bk-form-input" id="inputHostname" value="{$server.hostname}" placeholder="如不填写，系统默认自动生成">
	                                        	<span class="bk-form-row-li-info bk-ml2">长度为2-128个字符，以大小写字母或中文开头，可包含数字，"."，"_"或"-"</span>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>

	                            <div class="row hide">
	                                <div class="col-sm-12">
	                                    <div class="form-group">
	                                        <label for="inputNs1prefix">{$LANG.serverns1prefix}</label>
	                                        <input type="text" name="ns1prefix" class="form-control" id="inputNs1prefix" value="{if $server.ns1prefix}{$server.ns1prefix}{else}1{/if}" placeholder="ns1">
	                                    </div>
	                                </div>
	                                <div class="col-sm-12">
	                                    <div class="form-group">
	                                        <label for="inputNs2prefix">{$LANG.serverns2prefix}</label>
	                                        <input type="text" name="ns2prefix" class="form-control" id="inputNs2prefix" value="{if $server.ns2prefix}{$server.ns2prefix}{else}2{/if}" placeholder="ns2">
	                                    </div>
	                                </div>
	                            </div>

                            </dd>
                        </dl>
                    {/if}
	
	                {if $customfields}
	
	                    <h5 class="line">
	                        <span>{$LANG.orderadditionalrequiredinfo}</span>
	                    </h5>
	
	                    <div class="field-container">
	                        {foreach $customfields as $customfield}
	                            <div class="form-group">
	                                <label for="customfield{$customfield.id}">{$customfield.name}</label>
	                                {$customfield.input}
	                                {if $customfield.description}
	                                    <span class="field-help-text">
	                                        {$customfield.description}
	                                    </span>
	                                {/if}
	                            </div>
	                        {/foreach}
	                    </div>
	
	                {/if}
		        	{if $pricing.type eq "recurring"}
	                    <div class="field-container">
		                    <h5 class="line">
			                    <i class="bk-group-title-icon icon-buy-chargeType"></i>
			                    {$LANG.cartchoosecycle}
		                    </h5>
	                        <div class="bk-group-detail">

                                <div class="row order-list">
                                {if $pricing.monthly}
                                    <div data-cycle="monthly" class="col-sm-3 {if $billingcycle eq "monthly"}selected{/if}">
                                    <input type="radio" name="billingcycle" value="monthly" {if $billingcycle eq "monthly"}checked{/if} />
                                        <div class="panel panel-default">
                                        	<div class="panel-body text-center">
	                                        	{assign var=value value=" "|explode:$pricing.monthly}
                                            	<span>{$value[1]}</span>
                                            	<span>{$value[0]}</span>
                                            </div>
                                        </div>
                                    </div>
                                {/if}
                                {if $pricing.quarterly}
                                    <div data-cycle="quarterly" class="col-sm-3 {if $billingcycle eq "quarterly"}selected{/if}">
                                    <input type="radio" name="billingcycle" value="quarterly" {if $billingcycle eq "quarterly"}checked{/if} />
                                        <div class="panel panel-default">
                                        	<div class="panel-body text-center">
	                                        	{assign var=value value=" "|explode:$pricing.quarterly}
                                            	<span>{$value[1]}</span>
                                            	<span>{$value[0]}</span>
                                            </div>
                                        </div>
                                    </div>
                                {/if}
                                {if $pricing.semiannually}
                                    <div data-cycle="semiannually" class="col-sm-3 {if $billingcycle eq "semiannually"}selected{/if}">
                                    <input type="radio" name="billingcycle" value="semiannually" {if $billingcycle eq "semiannually"}checked{/if} />
                                        <div class="panel panel-default">
                                        	<div class="panel-body text-center">
	                                        	{assign var=value value=" "|explode:$pricing.semiannually}
                                            	<span>{$value[1]}</span>
                                            	<span>{$value[0]}</span>
                                            </div>
                                        </div>
                                    </div>
                                {/if}
                                {if $pricing.annually}
                                    <div data-cycle="annually" class="col-sm-3 {if $billingcycle eq "annually"}selected{/if}">
                                    <input type="radio" name="billingcycle" value="annually" {if $billingcycle eq "annually"}checked{/if} />
                                        <div class="panel panel-default">
                                        	<div class="panel-body text-center">
                                            	<i class="bk-button-icon alico icon-buy-hui bk-icon-orange"></i>
	                                        	{assign var=value value=" "|explode:$pricing.annually}
                                            	<span>{$value[1]}</span>
                                            	<span>{$value[0]}</span>
                                            </div>
                                        </div>
                                    </div>
                                {/if}
                                {if $pricing.biennially}
                                    <div data-cycle="biennially" class="col-sm-3 {if $billingcycle eq "biennially"}selected{/if}">
                                    <input type="radio" name="billingcycle" value="biennially" {if $billingcycle eq "biennially"}checked{/if}/>
                                        <div class="panel panel-default">
                                        	<div class="panel-body text-center">
                                            	<i class="bk-button-icon alico icon-buy-hui bk-icon-orange"></i>
	                                        	{assign var=value value=" "|explode:$pricing.biennially}
                                            	<span>{$value[1]}</span>
                                            	<span>{$value[0]}</span>
                                            </div>
                                        </div>
                                    </div>
                                {/if}
                                {if $pricing.triennially}
                                    <div data-cycle="triennially" class="col-sm-3 {if $billingcycle eq "triennially"}selected{/if}">
                                    <input type="radio" name="billingcycle" value="triennially" {if $billingcycle eq "triennially"}checked{/if}/>
                                        <div class="panel panel-default">
                                        	<div class="panel-body text-center">
                                            	<i class="bk-button-icon alico icon-buy-hui bk-icon-orange"></i>
	                                        	{assign var=value value=" "|explode:$pricing.triennially}
                                            	<span>{$value[1]}</span>
                                            	<span>{$value[0]}</span>
                                            </div>
                                        </div>
                                    </div>
                                {/if}
                                </div>
                                
                            </div>
	                    </div>
	                {/if}
	
	                {if $addons}
	
	                    <h5 class="line">
		                    <i class="bk-group-title-icon icon-buy-storage"></i>
							{$LANG.cartavailableaddons}
						</h5>
	
	                    <div class="row addon-products">
	                        {foreach $addons as $addon}
	                            <div class="col-sm-6">
	                                <div class="panel panel-default panel-addon{if $addon.status} panel-addon-selected{/if}">
	                                    <div class="panel-body">
		                                    <input type="checkbox" name="addons[{$addon.id}]"{if $addon.status} checked{/if} />
	                                        <h4>
	                                            
	                                            {$addon.name}
	                                            <small>{$addon.pricing}</small>
	                                        </h4>
	                                        {$addon.description}
	                                    </div>
	                                    <div class="panel-add">
	                                        <i class="fa fa-plus"></i>
	                                        {$LANG.addtocart}
	                                    </div>
	                                </div>
	                            </div>
	                        {/foreach}
	                    </div>
	
	                {/if}
	            </div>
            </div>
            
            <div class="alert alert-danger hidden" role="alert" id="containerProductValidationErrors">
                <p>{$LANG.orderForm.correctErrors}:</p>
                <ul id="containerProductValidationErrorsList"></ul>
            </div>
            
            <div class="alert alert-warning info-text-sm">
                <i class="fa fa-question-circle"></i>
                {$LANG.orderForm.haveQuestionsContact} <a href="contact.php" target="_blank" class="alert-link">{$LANG.orderForm.haveQuestionsClickHere}</a>
            </div>

        </div>
        <div class="content-sidebar" id="scrollingPanelContainer">

            <div class="panel panel-summary" id="orderSummary">
                <div class="panel-header">
	                <div class="header-title">
	                    <h6><i class="zmdi zmdi-shopping-cart"></i> {$LANG.ordersummary}</h6>
	                    <div class="loader hidden" id="orderSummaryLoader">
	                    	<i class="spinner"></i>
	                    </div>
	                </div>
	            </div>
	            <div id="producttotal">
	                <div class="panel-body" style="position: relative;height: 100px;">
		                <i class="spinner"></i>
		            </div>
	            </div>
            </div>
            <div class="text-center">
                <button type="submit" id="btnCompleteProductConfig" class="btn btn-xlg btn-success btn-submit btn-block cart-next-step">
			        <span>
			        	<span>{$LANG.continue}</span>
						<i class="zmdi zmdi-long-arrow-right"></i>
					</span>
					<span class="button-loader hidden">
						<i class="spinner"></i>
					</span>
                </button>
            </div>

        </div>
	</div>

    </form>
</div>

<script>recalctotals();</script>
