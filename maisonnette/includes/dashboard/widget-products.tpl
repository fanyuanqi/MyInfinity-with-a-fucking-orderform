<div class="widget widget-fullwidth earnings">
    <div class="widget-head">
        <span class="title">激活的产品</span>
    </div>
    <div class="panel-cards {if $NWProducts|@count > 4} cards-carousel{/if}">
        {if $NWProducts}
            <ul class="cards">
                <li>
                    {foreach from=$NWProducts key=i item=prod}
                        <a class="card-row" href="clientarea.php?action=productdetails&id={$prod.id}">
                            <span class="cell-title">{$prod.name}</span>
                            <span class="cell-cycle">
                            	<span class="text-muted"></span>
                            	{$prod.domain}
                            </span>
                            {if $prod.nextduedate != '0000-00-00'}
                            <span class="cell-license">
                            	<span class="text-muted">到期: </span>
                            	{$prod.nextduedate}
                            </span>
                            {/if}
                        </a>
                        {if $NWProducts|@count != ($i+1)}
                            {if ($i+1) % 4 == 0}</li><li>{/if}
                        {/if}
                    {/foreach}
                </li>
            </ul>
            <div class="cards-nav">
                {if $NWProducts|@count > 4}
                <button class="card-prev btn btn-default btn-icon btn-link" type="button">
                	<i class="s7-angle-left"></i>
                </button>
                {/if}
                <span class="card-number"><b class="number-current">{if $NWProducts|@count > 4}4{else}{$NWProducts|@count}{/if}</b>/<span class="number-total">{$NWProducts|@count}</span></span>
                {if $NWProducts|@count > 4}
                <button class="card-next btn btn-default btn-icon btn-link" type="button">
                	<i class="s7-angle-right"></i>
                </button>
                {/if}
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
                    <span>你还没有激活的产品。</span>
                </div>
            </div>
        {/if}
    </div>
</div>