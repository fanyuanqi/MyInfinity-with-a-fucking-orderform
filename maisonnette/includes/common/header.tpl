<nav class="navbar navbar-full navbar-inverse navbar-fixed-top mai-top-header">
    <div class="container">
		<!--Logo-->
        {if $assetLogoPath}
            <a href="{$WEB_ROOT}/index.php" class="navbar-brand"><img src="{$assetLogoPath}" alt="{$companyname}"></a>
        {else}
            <a href="{$WEB_ROOT}/index.php" class="navbar-brand logo-text">{$companyname}</a>
        {/if}
        
        <!--Left Menu-->
        <ul class="nav navbar-nav mai-top-nav">
            <li class="nav-item">
                <a href="index.php" class="nav-link">首页</a>
            </li>
            <li class="nav-item dropdown">
                <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle">产品服务
                    <span class="angle-down s7-angle-down"></span>
                </a>
                <div role="menu" class="dropdown-menu">
                    <a href="#" class="dropdown-item">虚拟主机</a>
                    <a href="#" class="dropdown-item">云主机</a>
                    <a href="#" class="dropdown-item">服务器租用</a>
                    <a href="#" class="dropdown-item">服务器托管</a>
                    <a href="#" class="dropdown-item">大带宽租用</a>
                </div>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">技术支持</a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">关于我们</a>
            </li>
        </ul>
        <!--Icons Menu-->
        <ul class="navbar-nav float-lg-right mai-icons-nav">
        {if $languagechangeenabled && count($locales) > 1}
            <li class="dropdown nav-item">
                <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle">
                    <span class="icon s7-global"></span>
                </a>
                <div role="menu" class="dropdown-menu">
                    {foreach $locales as $locale}
                        <a href="{$currentpagelinkback}language={$locale.language}" class="dropdown-item">{$locale.localisedName}</a>
                    {/foreach}
                </div>
            </li>
        {/if}
	    {if $loggedin}
            <li class="dropdown nav-item mai-notifications">
                <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle">
                    <span class="icon s7-bell"></span>
                    {if count($clientAlerts) > 0}<span class="indicator"></span>{/if}
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <div class="title">{$LANG.notifications}</div>
                        <div class="mai-scroller ps-container ps-theme-default">
                            <div class="content">
                                <ul>
			                    {foreach $clientAlerts as $alert}
			                        <li>
			                            <a href="{$alert->getLink()}">
                                            <div class="icon">
                                                <span class="s7-check"></span>
                                            </div>
                                            <div class="content">
                                                <span class="desc">{$alert->getMessage()}</span>
                                                <span class="date">10 minutes ago</span>
                                            </div>
                                        </a>
			                        </li>
			                    {foreachelse}
			                        <li>
			                            {$LANG.notificationsnone}
			                        </li>
			                    {/foreach}
                                </ul>
                            </div>
                        </div>
                    </li>
                </ul>
            </li>
            <li class="dropdown nav-item">
                <a href="cart.php?a=view" class="nav-link">
                    <span class="icon s7-cart"></span>
                </a>
            </li>
        {else}
            <li class="dropdown nav-item">
            	<a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle">
	                <span class="icon s7-user"></span>
                </a>
                <div role="menu" class="dropdown-menu">
		            <a href="{$WEB_ROOT}/login.php" class="dropdown-item">{$LANG.login}</a>
		            {if $condlinks.allowClientRegistration}
		            <a href="{$WEB_ROOT}/register.php" class="dropdown-item">{$LANG.register}</a>
		            {/if}
                </div>
            </li>
        {/if}
        {if $adminMasqueradingAsClient || $adminLoggedIn}
            <li class="dropdown nav-item">
                <a href="logout.php?returntoadmin=1" class="btn btn-logged-in-admin nav-link" data-toggle="tooltip" data-placement="bottom" title="{if $adminMasqueradingAsClient}{$LANG.adminmasqueradingasclient} {$LANG.logoutandreturntoadminarea}{else}{$LANG.adminloggedin} {$LANG.returntoadminarea}{/if}">
                    <i class="icon s7-photo-gallery"></i>
                </a>
            </li>
        {/if}
        </ul>
        
	    {if $loggedin}
        <!--User Menu-->
        <ul class="nav navbar-nav float-lg-right mai-user-nav">
            <li class="dropdown nav-item">
                <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="dropdown-toggle nav-link">
                    <img src="//gravatar.neworld.org/avatar/{$clientsdetails.email|md5}?s=100&d={$systemurl}templates/{$template}/assets/img/default_family.jpg" alt="" />
                    <span class="user-name">{$clientsdetails.fullname}</span>
                    <span class="angle-down s7-angle-down"></span>
                </a>
                <div role="menu" class="dropdown-menu">
                    <a href="clientarea.php?action=details" class="dropdown-item">
                        <span class="icon s7-user"></span>
                        {$LANG.clientareanavdetails}
                    </a>
                        
	                <a href="clientarea.php?action=changepw" class="dropdown-item">
		                <span class="icon s7-tools"></span>
		                {$LANG.clientareanavchangepw}
		            </a>
		            
					{if $condlinks.addfunds}
					<a href="clientarea.php?action=addfunds" class="dropdown-item">
						<span class="icon s7-cash"></span>
						{$LANG.addfunds}
					</a>
					{/if}
                    <a href="logout.php" class="dropdown-item">
                        <span class="icon s7-power"></span>
                        {$LANG.clientareanavlogout}
                    </a>
                </div>
            </li>
        </ul>
        {/if}
    </div>
</nav>