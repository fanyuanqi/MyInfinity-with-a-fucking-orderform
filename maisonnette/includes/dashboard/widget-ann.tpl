<div class="usage usage-primary usage-news">
    <div class="usage-head">
        <span class="usage-head-title">最新消息</span>
    </div>
    <div class="usage-resume">
        <div class="usage-data">
            {if $announcements}
            	{foreach from=$announcements key=i item=ann}
	            	{if $ann@index < 3}
	                	<span class="usage-detail">{$ann['title']}</span>
						<span class="usage-title">{$ann['date']}</span>
			        {/if}
		        {/foreach}
	        {else}
            	<span class="usage-detail">暂时没有任何公告信息</span>
	        {/if}
        </div>
        <div class="usage-icon">
            <span class="icon s7-news-paper"></span>
        </div>
    </div>
</div>
<div class="usage usage-dark">
    <div class="usage-head">
        <span class="usage-head-title">推广联盟</span>
    </div>
    <div class="usage-resume">
        <div class="usage-data">
            <span class="usage-counter">{$addons_html['1']['balance']} <small>元</small></span>
            <span class="usage-title">当前的佣金余额</span>
        </div>
        <div class="usage-icon">
            <span class="icon s7-display1"></span>
        </div>
    </div>
</div>