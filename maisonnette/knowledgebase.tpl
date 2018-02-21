<section class="cover imagebg height-60 text-center" data-overlay="3">
    <div class="background-image-holder" style="background: url('{$WEB_ROOT}/templates/{$template}/assets/img/knowledge-1.jpg'); opacity: 1;">
        <img alt="background" src="{$WEB_ROOT}/templates/{$template}/assets/img/knowledge-1.jpg">
    </div>
    <div class="container pos-vertical-center">
        <div class="row">
            <div class="col-sm-12">
                <h1 style="font-size: 3.14285714em;font-weight: 300;font-variant-ligatures: common-ligatures;line-height: 1.31818182em;margin-bottom: 0.59090909090909em">{$LANG.knowledgebasetitle}</h1>
                <p class="lead">
                    {$LANG.knowledgebaseintrotext}
                </p>
                <div class="boxed boxed--lg bg--white text-left">
                    <form role="form" method="post" action="{routePath('knowledgebase-search')}">
					    <div class="input-group input-group-lg kb-search">
					        <input type="text" id="inputKnowledgebaseSearch" name="search" class="form-control" placeholder="What can we help you with?" />
					        <span class="input-group-btn">
					            <input type="submit" id="btnKnowledgebaseSearch" class="btn btn-primary btn-input-padded-responsive" value="{$LANG.search}" />
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

<section class="text-center space--xs bg--white">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h2>{$LANG.knowledgebasecategories}</h2>
            </div>
        </div>
        <!--end of row-->
    </div>
    <!--end of container-->
</section>

<section class="bg--white">
    <div class="container">
        <!--end of row-->
        {if $kbcats}
        <div class="row">
	        {foreach from=$kbcats name=kbcats item=kbcat}
	        <div class="col-sm-4">
	            <div class="feature feature-4 boxed boxed--lg boxed--border">
	                <i class="icon icon--md s7-notebook"></i>
	                <h4>{$kbcat.name}</h4>
	                <hr>
	                <p style="min-height: auto;">{$kbcat.description}</p>
	                <a class="btn btn-primary" href="{routePath('knowledgebase-category-view', {$kbcat.id}, {$kbcat.urlfriendlyname})}">
	                    <span class="btn__text">
	                        Learn More
	                    </span>
	                </a>
	            </div>
	        </div>
	        {/foreach}
        </div>
		{else}
		    {include file="$template/includes/alert.tpl" type="info" msg=$LANG.knowledgebasenoarticles textcenter=true}
		{/if}
    </div>
    <!--end of container-->
</section>

{if $kbmostviews}
<div style="display: none">
    <h2>{$LANG.knowledgebasepopular}</h2>

    <div class="kbarticles">
        {foreach from=$kbmostviews item=kbarticle}
            <a href="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}">
                <span class="glyphicon glyphicon-file"></span>&nbsp;{$kbarticle.title}
            </a>
            <p>{$kbarticle.article|truncate:100:"..."}</p>
        {/foreach}
    </div>
</div>
{/if}
