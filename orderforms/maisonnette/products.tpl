{include file="orderforms/$carttpl/common.tpl"}
<script type="text/javascript" src="{$WEB_ROOT}/templates/orderforms/{$carttpl}/js/baguetteBox.js"></script>
<link rel="stylesheet" type="text/css" href="{$WEB_ROOT}/templates/orderforms/{$carttpl}/css/baguetteBox.css" />
<!-- NAV START -->
{include file="orderforms/$carttpl/nav-top.tpl" step="1"}
<!-- NAV END -->

<div id="order-standard_cart" class="main-content container">
	
	<div class="row page-head">
        <div class="col-md-4 page-head-heading">
            <h1>
                {if $productGroup.headline}
                    {$productGroup.headline}
                {else}
                    {$productGroup.name}
                {/if}
            </h1>
        </div>
        {if $productGroup.tagline}
        <div class="col-md-8 page-head-desc">
            <h3>{$productGroup.tagline}</h3>
        </div>
        {else}
        <div class="col-md-8 page-head-desc pull-right">
        	{include file="orderforms/{$carttpl}/sidebar-categories-collapsed.tpl"}
        </div>
        {/if}
        {if $errormessage}
            <div class="col-sm-12 alert alert-danger">
                {$errormessage}
            </div>
        {/if}
    </div>
    
    {foreach $hookAboveProductsOutput as $output}
        <div>
            {$output}
        </div>
    {/foreach}
    
    <div class="row pricing-tables">
        {foreach $products as $key => $product}
		<div class="col-md-4">
            <div class="pricing-table">
				<div class="pricing-table-title">{$product.name}</div>
				<div class="pricing-table-price">
					{if $product.bid}
                        {$LANG.bundledeal}<br />
                        {if $product.displayprice}
                            <span class="price">{$product.displayprice}</span>
                        {/if}
                    {else}
                        {if $product.pricing.hasconfigoptions}
                            {$LANG.startingfrom}
                            <br />
                        {/if}
                        <span class="price">{$product.pricing.minprice.price}</span>
                        <br />
                        {if $product.pricing.minprice.cycle eq "monthly"}
                            {$LANG.orderpaymenttermmonthly}
                        {elseif $product.pricing.minprice.cycle eq "quarterly"}
                            {$LANG.orderpaymenttermquarterly}
                        {elseif $product.pricing.minprice.cycle eq "semiannually"}
                            {$LANG.orderpaymenttermsemiannually}
                        {elseif $product.pricing.minprice.cycle eq "annually"}
                            {$LANG.orderpaymenttermannually}
                        {elseif $product.pricing.minprice.cycle eq "biennially"}
                            {$LANG.orderpaymenttermbiennially}
                        {elseif $product.pricing.minprice.cycle eq "triennially"}
                            {$LANG.orderpaymenttermtriennially}
                        {/if}
                        <br>
                        {if $product.pricing.minprice.setupFee}
                            <small>{$product.pricing.minprice.setupFee->toPrefixed()} {$LANG.ordersetupfee}</small>
                        {/if}
                    {/if}
				</div>
              <div class="panel-divider panel-divider-xl"></div>
                {if $product.featuresdesc}
                    <p id="product{$product@iteration}-description">
                        {$product.featuresdesc}
                    </p>
                {/if}
				<ul class="pricing-table-features">
                    {foreach $product.features as $feature => $value}
                        <li id="product{$product@iteration}-feature{$value@iteration}">
                            <span class="feature-value">{$value}</span>
                            {$feature}
                        </li>
                    {/foreach}
                </ul>
                <a href="cart.php?a=add&{if $product.bid}bid={$product.bid}{else}pid={$product.pid}{/if}" class="btn btn-primary" id="product{$product@iteration}-order-button">
                    {$LANG.ordernowbutton}
                </a>
            </div>
        </div>
        {/foreach}
    </div>

    {foreach $hookBelowProductsOutput as $output}
        <div>
            {$output}
        </div>
    {/foreach}
    
</div>
