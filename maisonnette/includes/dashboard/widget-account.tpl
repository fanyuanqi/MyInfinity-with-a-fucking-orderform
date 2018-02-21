<div class="user-stats">
    <div class="user-stats-id">
        <div class="user-stats-avatar">
            <img src="//gravatar.neworld.org/avatar/{$clientsdetails.email|md5}?s=100&d={$systemurl}templates/{$template}/assets/img/default_family.jpg" alt="avatar">
        </div>
        <div class="user-stats-info">
            <span class="user-stats-name">{$clientsdetails.fullname}</span>
            <span class="user-stats-position">{$clientsdetails.companyname}</span></div>
    </div>
    <div class="user-stats-indicators">
        <div class="user-stats-indicator">
			<span class="user-stats-indicator-title">{$clientsdetails.address1} {$clientsdetails.address2}<br/>
			{$clientsdetails.postcode} {$clientsdetails.city}, {$clientsdetails.countryname}<br/>
			{$clientsdetails.email}</span>
		</div>
    </div>
	<div class="user-stats-balance">
		<h6 class="mb-5">{$LANG.statscreditbalance}</h6>
		<div class="price">
			{$clientsstats.creditbalance}
		</div>
	</div>
	{if $condlinks.addfunds}
		<a class="user-stats-more-details" href="clientarea.php?action=addfunds">{$LANG.addfunds}</a>
	{/if}
</div>