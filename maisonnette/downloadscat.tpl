<section class="cover imagebg height-60 text-center" data-overlay="3">
    <div class="background-image-holder" style="background: url('{$WEB_ROOT}/templates/{$template}/assets/img/knowledge-1.jpg'); opacity: 1;">
        <img alt="background" src="{$WEB_ROOT}/templates/{$template}/assets/img/knowledge-1.jpg">
    </div>
    <div class="container pos-vertical-center">
        <div class="row">
            <div class="col-sm-12">
                <h1 style="font-size: 3.14285714em;font-weight: 300;font-variant-ligatures: common-ligatures;line-height: 1.31818182em;margin-bottom: 0.59090909090909em">{$LANG.downloadstitle}</h1>
                <p class="lead">
                    {$LANG.downloadsintrotext}
                </p>
                <div class="boxed boxed--lg bg--white text-left">
					<form role="form" method="post" action="{routePath('download-search')}">
				        <div class="input-group input-group-lg kb-search margin-bottom">
				            <input type="text" name="search" id="inputDownloadsSearch" class="form-control" placeholder="{$LANG.downloadssearch}" />
				            <span class="input-group-btn">
				                <input type="submit" id="btnDownloadsSearch" class="btn btn-primary btn-input-padded-responsive" value="{$LANG.search}" />
				            </span>
				        </div>
				    </form>
                </div>
            </div>
        </div>
        <!--end of row-->
    </div>
    <!--end of container-->
</section>

{if $dlcats}
<section class="bg--white">
    <div class="container">
	    <div class="row">
            <div class="col-sm-12 text-center mt-0 mb-6">
                <h2>{$LANG.downloadscategories}</h2>
            </div>
        </div>
        <!--end of row-->
        <div class="row">
        {foreach $dlcats as $dlcat}
	        <div class="col-sm-3">
                <a class="block" href="{routePath('download-by-cat', $dlcat.id, $dlcat.urlfriendlyname)}">
                    <div class="feature boxed boxed--border border--round text-center">
                        <i class="icon--lg s7-cloud-download"></i>
                        <span class="h5 color--primary">{$dlcat.name}</span>
                    </div>
                </a>
            </div>
        {foreachelse}
            <div class="col-sm-12">
                <p class="text-center fontsize3">{$LANG.downloadsnone}</p>
            </div>
        {/foreach}
        </div>
    </div>
    <!--end of container-->
</section>
{/if}

<section class="bg--dark">
    <div class="container">
	    <div class="row">
            <div class="col-sm-12 text-center mt-0 mb-6">
                <h2>{$LANG.downloadsfiles}</h2>
            </div>
        </div>
        <!--end of row-->
        <div class="row">
		{foreach $downloads as $download}
            <div class="col-sm-4">
                <div class="feature feature-1 boxed boxed--border">
                    <h5 class="mb-3">{$download.title}{if $download.clientsonly}
                        <i class="fa fa-lock text-muted"></i>
                    {/if}</h5>
                    <p class="mb-2">{$download.description}</p>
					<small>{$LANG.downloadsfilesize}: {$download.filesize}</small>
                    <a href="{$download.link}">{$LANG.downloadname}</a>
                </div>
                <!--end feature-->
            </div>
        {foreachelse}
            <span class="list-group-item text-center">
                {$LANG.downloadsnone}
            </span>
        {/foreach}
        </div>
        <!--end of row-->
    </div>
    <!--end of container-->
</section>
