<div class="row email">
	<div class="col-md-3 email-aside hidden-print">
		<div class="aside-content">
			<div class="content">
				<div class="aside-nav navbar-collapse collapse">
					<div class="aside-compose">
						<form action="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}" method="post">
					        <input type="hidden" name="useful" value="vote">
					        <div style="display: block;margin-bottom: 10px;">
					        {if $kbarticle.voted}{$LANG.knowledgebaserating}{else}{$LANG.knowledgebasehelpful}{/if}
					        </div>
					        {if $kbarticle.voted}
					            {$kbarticle.useful} {$LANG.knowledgebaseratingtext} ({$kbarticle.votes} {$LANG.knowledgebasevotes})
					        {else}
					            <button type="submit" name="vote" value="yes" class="btn btn-space btn-primary"><i class="fa fa-thumbs-o-up"></i> {$LANG.knowledgebaseyes}</button>
					            <button type="submit" name="vote" value="no" class="btn btn-space btn-info"><i class="fa fa-thumbs-o-down"></i> {$LANG.knowledgebaseno}</button>
					        {/if}
					    </form>
					</div>
					{if $kbarticles}
					<span class="title">Related Articles</span>
					<ul class="navbar-nav nav-pills nav-stacked">
			            {foreach key=num item=kbarticle from=$kbarticles}
	                    <li class="nav-item">
	                    	<a class="nav-link" href="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}">
	                        	{$kbarticle.title}
	                    	</a>
	                    </li>
			            {/foreach}
                	</ul>
					{/if}
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-9 email-content">
		<div class="email-detail-head">
	        <div class="email-head-subject" style="margin-top: 0;">
	            <div class="title"><span>{$kbarticle.title}</span></div>
	        </div>
			<a href="#" class="btn btn-link btn-print" onclick="window.print();return false"><i class="fa fa-print"></i></a>
        </div>
        <div class="email-body">
	        {if $kbarticle.voted}
			    {include file="$template/includes/alert.tpl" type="success alert-bordered-left" msg="{lang key="knowledgebaseArticleRatingThanks"}" textcenter=true}
			{/if}
			{$kbarticle.text}
			<ul class="kb-article-details">
				{if $kbarticle.tags }
			    <li><i class="fa fa-tag"></i> {$kbarticle.tags}</li>
			    {/if}
			    <li><i class="fa fa-star"></i> {$kbarticle.useful} {$LANG.knowledgebaseratingtext}</li>
			</ul>
        </div>
	</div>
</div>
