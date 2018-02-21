<div class="main-content container">
    <div class="splash-container row">
        <div class="col-sm-6 user-message">
	        <span class="splash-message text-right">Oops!<br> this will take<br> just a moment.</span>
	    </div>
        <div class="col-sm-6 form-message">
		    <!--Logo-->
	        {if $assetLogoPath}
	            <a href="{$WEB_ROOT}/index.php" class="navbar-brand"><img src="{$assetLogoPath}" alt="{$companyname}"></a>
	        {else}
	            <a href="{$WEB_ROOT}/index.php" class="navbar-brand logo-text">{$companyname}</a>
	        {/if}
	        {if $loggedin}
		        {include file="$template/includes/alert.tpl" type="error" msg=$LANG.noPasswordResetWhenLoggedIn textcenter=true}
		    {else}
		        {if $success}
		
		            {include file="$template/includes/alert.tpl" type="success" msg=$LANG.pwresetvalidationsent textcenter=true}
		
		            <span class="splash-description text-center mt-5 mb-5">{$LANG.pwresetvalidationcheckemail}</span>
		
		        {else}
		
		            {if $errormessage}
		                {include file="$template/includes/alert.tpl" type="error" msg=$errormessage textcenter=true}
		            {/if}
		
		            {if $securityquestion}
		
		                <span class="splash-description text-center mt-5 mb-5">{$LANG.pwresetsecurityquestionrequired}</span>
		
		                <form method="post" action="pwreset.php" class="form-forgot-password">
		                    <input type="hidden" name="action" value="reset" />
		                    <input type="hidden" name="email" value="{$email}" />
		
		                    <div class="form-group">
		                        <label for="inputAnswer">{$securityquestion}</label>
		                        <input type="text" name="answer" class="form-control" id="inputAnswer" autofocus>
		                    </div>
		
		                    <div class="form-group login-submit">
		                        <button type="submit" class="btn btn-lg btn-primary btn-block">{$LANG.pwresetsubmit}</button>
		                    </div>
		
		                </form>
		
		            {else}
		
		                <span class="splash-description text-center mt-5 mb-5">{$LANG.pwresetemailneeded}</span>
		
		                <form method="post" action="{$systemsslurl}pwreset.php" role="form" class="form-forgot-password">
		                    <input type="hidden" name="action" value="reset" />
		
		                    <div class="form-group">
		                		<div class="input-group">
				                	<span class="input-group-addon"><i class="icon s7-mail"></i></span>
			                        <input type="email" name="email" class="form-control" id="inputEmail" placeholder="{$LANG.enteremail}" autofocus>
		                		</div>
		                    </div>
		
		                    <div class="form-group login-submit">
		                        <button type="submit" class="btn btn-lg btn-primary btn-block">{$LANG.pwresetsubmit}</button>
		                    </div>
		
		                </form>
						<div class="out-links"><a href="#">© 2017 Your {$companyname}</a></div>
		
		            {/if}
		
		        {/if}
		    {/if}
        </div>
    </div>
</div>
