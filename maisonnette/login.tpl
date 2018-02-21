<div class="splash-container row">
    <div class="col-sm-6 user-message">
        <span class="splash-message text-right">
        	Hello!
            <br>is good to
            <br>see you again
        </span>
        <span class="alternative-message text-center">
			<div class="form-group quick-login push-30-t">
		        <div class="line push-10"><span>更多登录方式</span></div>
	        	<div class="outside-login-list row">
		        	<div class="col-md-4 col-sm-6">
			        	<a class="outside-login-btn mail actived" href="javascript:Mail_Login();">
				        	<em><i class="mail-login-icon"></i></em>
				        	<span>邮箱账号</span>
			        	</a>
		        	</div>
		        	<div class="col-md-4 col-sm-6">
			        	<a class="outside-login-btn qq actived" href="javascript:QQ_login2('login');">
				        	<em><i class="qq-login-icon"></i></em>
				        	<span>QQ账号</span>
			        	</a>
		        	</div>
		        	{$qqlink}
		        	<div class="col-md-4 hidden-xs">
			        	<a class="outside-login-btn wechat actived" href="javascript:WeChat_Login2('login');">
				        	<em><i class="wechat-login-icon"></i></em>
				        	<span>微信账号</span>
			        	</a>
		        	</div>
		        </div>
	        </div>
	        
	        <div class="form-group push-30-t hidden{if !$linkableProviders} hidden{/if}">
	            {include file="$template/includes/linkedaccounts.tpl" linkContext="login" customFeedback=true}
	        </div>
        </span>
    </div>
    <div class="col-sm-6 form-message">
	    <!--Logo-->
        {if $assetLogoPath}
            <a href="{$WEB_ROOT}/index.php" class="navbar-brand"><img src="{$assetLogoPath}" alt="{$companyname}"></a>
        {else}
            <a href="{$WEB_ROOT}/index.php" class="navbar-brand logo-text">{$companyname}</a>
        {/if}
        <span class="splash-description text-center mt-5 mb-5">{$LANG.login}</span>
		{if $incorrect}
	        {include file="$template/includes/alert.tpl" type="error" msg=$LANG.loginincorrect textcenter=true}
	    {elseif $verificationId && empty($transientDataName)}
	        {include file="$template/includes/alert.tpl" type="error" msg=$LANG.verificationKeyExpired textcenter=true}
	    {elseif $ssoredirect}
	        {include file="$template/includes/alert.tpl" type="info" msg=$LANG.sso.redirectafterlogin textcenter=true}
	    {/if}
		<div class="login-content">
			<div class="whmcs-body">
		        <form method="post" action="{$systemurl}dologin.php" role="form">
		            <div class="form-group">
		                <div class="input-group">
		                    <span class="input-group-addon">
		                        <i class="icon s7-user"></i>
		                    </span>
		                    <input type="email" name="username" class="form-control" id="inputEmail" placeholder="{$LANG.enteremail}" autofocus>
		                </div>
		            </div>
		            <div class="form-group">
		                <div class="input-group">
		                    <span class="input-group-addon">
		                        <i class="icon s7-lock"></i>
		                    </span>
		                    <input type="password" name="password" class="form-control" id="inputPassword" placeholder="{$LANG.clientareapassword}" autocomplete="off" >
		                </div>
		            </div>
		            <div class="form-group login-submit">
		                <button data-dismiss="modal" type="submit" class="btn btn-lg btn-primary btn-block">{$LANG.loginbutton}</button></div>
		            <div class="form-group row login-tools">
		                <div class="col-6 login-remember">
		                    <label class="custom-control custom-checkbox mt-2">
		                        <input type="checkbox" name="rememberme" class="custom-control-input">
		                        <span class="custom-control-indicator"></span>
		                        <span class="custom-control-description">{$LANG.loginrememberme}</span></label>
		                </div>
		                <div class="col-6 pt-2 text-right login-forgot-password">
		                    <a href="pwreset.php">{$LANG.forgotpw}</a>
		                </div>
		            </div>
		        </form>
			</div>
	    </div>
        <div class="out-links">
            <a href="#">&copy; 2017 {$companyname}</a>
        </div>
    </div>
</div>
<script>
function Mail_Login( val ) {
	$('.whmcs-body').show();
	$('.qq-body').remove();
	$('.wechat-body').remove();
}
</script>