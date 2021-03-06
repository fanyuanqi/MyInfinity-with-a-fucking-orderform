<div class="page-navbar secondary-navbar">
	<div class="container" style="position: relative">
		<ul class="nav navbar-nav navbar-steps">
			<li class="step {if $step == '1'}active{/if}">
	            <a href="{$systemurl}">
	                <span class="step-number"><i class="zmdi zmdi-n-1-square zmdi-hc-fw"></i></span>
	                <span class="step-title">{$LANG.cartproductselection}</span>
	            </a>
	        </li>
	        <li class="step {if $step == '2'}active{/if}">
                <a href="{$systemurl}cart.php?a=confproduct">
					<span class="step-number"><i class="zmdi zmdi-n-2-square zmdi-hc-fw"></i></span>
					<span class="step-title">{$LANG.cartproductchooseoptions}</span>
        		</a>
            </li>
            <li class="step {if $step == '3'}active{/if}">
                <a href="{$systemurl}cart.php?a=view">
                	<span class="step-number"><i class="zmdi zmdi-n-3-square zmdi-hc-fw"></i></span>
					<span class="step-title">{$LANG.cartreviewcheckout}</span>
            	</a>
            </li>

			<li class="pull-right hide">
				<div id="cart-preview">
					<a href="" class="btn btn-icon btn-circle preview-cart-badge {if !$cart['count']}badge-hidden{/if}">
						<i class="icon icon-shopping"></i>
						<span class="badge badge-primary">
							<b><span class="cart-preview-qty">{$cart['count']}</span></b>
						</span>
					</a>
					<div class="cart-dropdown" id="cart-preview-dropdown">
						<div class="dropdown-menu dropdown-menu-right">
							{if $cart['list']}
							<div class="scroll-list cart-preview-scrollbar ps-container ps-theme-default">
								<ul>
									{foreach from=$cart['list']  key=i item=$page}
			                        <li>
			                            <a href="{$systemurl}cart.php?a=confproduct&i={$i}">
											<div class="name">
												{$page['name']}
												<span class="domain">{$page['domain']}</span>
			                        		</div>
											<div class="price">
												<b>{$cart['prefix']}{$page['amount']} {$cart['suffix']}</b>                                                                        											</div>
			                			</a>
									</li>
									{/foreach}
	                    		</ul>
								<div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 0px;">
									<div class="ps-scrollbar-x" tabindex="0" style="left: 0px; width: 0px;"></div>
								</div>
								<div class="ps-scrollbar-y-rail" style="top: 0px; right: 0px;">
									<div class="ps-scrollbar-y" tabindex="0" style="top: 0px; height: 0px;"></div>
								</div>
							</div>
						    <div class="cart-total">
						        <ul>
						            <li>{$LANG.ordertotalduetoday}:<span class="cart-preview-total">{$cart['prefix']} {$cart['amount']} {$cart['suffix']}</span></li>
						        </ul>
						        <a href="{$WEB_ROOT}/cart.php?a=view" class="btn btn-primary btn-block"><span>查看我的购物车</span></a>
						    </div>
							{else}
							<div class="no-data no-data-sm">
								<div class="no-data-slogan">
					                <div class="icon-holder">
						                <i class="icon icon-shopping"></i>
										<div class="circle"> <i class="zmdi zmdi-close"></i> </div>
					                </div>
									<p>购物车是空的</p>
								</div>
							</div>
							{/if}
						</div>
					</div>
				</div>
			</li>
		</ul>
	{if $currencies}
	    <div class="currencies" style="right: 8px;">
	        <form method="post" action="{$WEB_ROOT}/cart.php{if $action}?a={$action}{elseif $gid}?gid={$gid}{/if}">
	            <select name="currency" onchange="submit()" class="form-control">
	                <option value="">{$LANG.choosecurrency}</option>
	                {foreach from=$currencies item=listcurr}
	                    <option value="{$listcurr.id}"{if $listcurr.id == $currency.id} selected{/if}>{$listcurr.code}</option>
	                {/foreach}
	            </select>
	        </form>
	    </div>
	{/if}
	</div>
</div>