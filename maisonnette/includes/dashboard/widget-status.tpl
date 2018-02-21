
<div class="widget-indicators">
    <div class="indicator-item">
        <div class="indicator-item-icon">
            <div class="icon">
                <span class="s7-cart"></span>
            </div>
        </div>
        <div class="indicator-item-value">
            <span data-toggle="counter" data-end="{$clientsstats.productsnumactive}" class="indicator-value-counter">{$clientsstats.productsnumactive}</span>
            <div class="indicator-value-title">{$LANG.navservices}</div></div>
    </div>
    <div class="indicator-item">
        <div class="indicator-item-icon">
            <div class="icon">
                <span class="s7-graph3"></span>
            </div>
        </div>
        <div class="indicator-item-value">
            <span data-toggle="counter" data-end="{$clientsstats.numactivetickets}" class="indicator-value-counter">{$clientsstats.numactivetickets}</span>
            <div class="indicator-value-title">{$LANG.navtickets}</div>
        </div>
    </div>
    <div class="indicator-item">
        <div class="indicator-item-icon">
            <div class="icon">
                <span class="s7-graph"></span>
            </div>
        </div>
        <div class="indicator-item-value">
            <span data-toggle="counter" data-end="{$clientsstats.numunpaidinvoices}" class="indicator-value-counter">{$clientsstats.numunpaidinvoices}</span>
            <div class="indicator-value-title">{$LANG.navinvoices}</div>
        </div>
    </div>
    {if $registerdomainenabled || $transferdomainenabled}
    <div class="indicator-item">
        <div class="indicator-item-icon">
            <div class="icon">
                <span class="s7-cash"></span>
            </div>
        </div>
        <div class="indicator-item-value">
            <span data-toggle="counter" data-end="{$clientsstats.numactivedomains}" class="indicator-value-counter">{$clientsstats.numactivedomains}</span>
            <div class="indicator-value-title">{$LANG.navdomains}</div></div>
    </div>
    {elseif $condlinks.affiliates && $clientsstats.isAffiliate}
    <div class="indicator-item">
        <div class="indicator-item-icon">
            <div class="icon">
                <span class="s7-cash"></span>
            </div>
        </div>
        <div class="indicator-item-value">
            <span data-toggle="counter" data-end="{$clientsstats.numaffiliatesignups}" class="indicator-value-counter">{$clientsstats.numaffiliatesignups}</span>
            <div class="indicator-value-title">{$LANG.affiliatessignups}</div></div>
    </div>
    {else}
    <div class="indicator-item">
        <div class="indicator-item-icon">
            <div class="icon">
                <span class="s7-cash"></span>
            </div>
        </div>
        <div class="indicator-item-value">
            <span data-toggle="counter" data-end="{$clientsstats.numquotes}" class="indicator-value-counter">{$clientsstats.numquotes}</span>
            <div class="indicator-value-title">{$LANG.quotes}</div>
        </div>
    </div>
    {/if}
</div>