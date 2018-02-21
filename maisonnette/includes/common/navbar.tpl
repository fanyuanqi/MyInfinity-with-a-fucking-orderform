<nav class="navbar mai-sub-header">
    <div class="container">
	    <!-- Mega Menu structure-->
	    <nav class="navbar navbar-toggleable-sm">
			<button type="button" data-toggle="collapse" data-target="#mai-navbar-collapse" aria-controls="#mai-navbar-collapse" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler hidden-md-up collapsed">
		        <div class="icon-bar">
			        <span></span>
			        <span></span>
			        <span></span>
			    </div>
			</button>
			<div id="mai-navbar-collapse" class="navbar-collapse collapse mai-nav-tabs">
		        <ul class="nav navbar-nav">
				    {include file="$template/includes/navbar.tpl" navbar=$primaryNavbar}
				</ul>
			</div>
	    </nav>
		<!--Search input-->
		<form role="form" method="post" action="clientarea.php?action=kbsearch">
	        <div class="search">
				<input type="text" name="search" placeholder="{$LANG.clientHomeSearchKb}" name="q" />
				<span class="s7-search"></span>
			</div>
		</form>
	</div>
</nav>