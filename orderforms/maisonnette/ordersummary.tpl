<div class="panel-list scroll-list">
	<ul class="list-summary">
		<li class="summary-item">
			<div class="item-row">
		        <div class="item-name">
		            {$producttotals.productinfo.name}
		        </div>
		        <div class="item-price">
		            <b>{$producttotals.pricing.baseprice}</b>
		        </div>
			</div>
		</li>
		
		{foreach $producttotals.configoptions as $configoption}
		    {if $configoption}
				<li class="summary-item">
					<div class="item-row">
				        <div class="item-name">
				            {$configoption.name}
				            <span class="item-domain">
				            	{$configoption.optionname}
				            	{if $configoption.name == '储存'}GB{/if}
				            	{if $configoption.name == '带宽'}MB{/if}
				            </span>
				        </div>
				        <div class="item-price">
				            <b>{$configoption.recurring}{if $configoption.setup} + {$configoption.setup} {$LANG.ordersetupfee}{/if}</b>
				        </div>
					</div>
				</li>
		    {/if}
		{/foreach}
		
		{foreach $producttotals.addons as $addon}
		<li class="summary-item">
			<div class="item-row">
		        <div class="item-name">
		            + {$addon.name}
		        </div>
		        <div class="item-price">
		            <b>{$addon.recurring}</b>
		        </div>
			</div>
		</li>
		{/foreach}
	</ul>
</div>

{if $producttotals.pricing.setup || $producttotals.pricing.recurring || $producttotals.pricing.addons}
<div class="panel-list">
    <ul class="list-subtotal">
        {if $producttotals.pricing.setup}
            <li class="hide">
                {$LANG.cartsetupfees}
                <span>{$producttotals.pricing.setup}</span>
            </li>
        {/if}
        {foreach from=$producttotals.pricing.recurringexcltax key=cycle item=recurring}
            <li>
                {$cycle}
                <span>{$recurring}</span>
            </li>
        {/foreach}
    </ul>
</div>
{/if}
<div class="total">
    <span>{$LANG.ordertotalduetoday}</span>
    {$producttotals.pricing.totaltoday}
</div>