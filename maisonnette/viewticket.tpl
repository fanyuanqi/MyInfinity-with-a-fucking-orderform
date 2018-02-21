<div class="main-content container">
{if !$invalidTicketId}
    <div class="panel panel-ticket">
        <div class="panel-body">
			{if $invalidTicketId}
			
			    {include file="$template/includes/alert.tpl" type="danger" title=$LANG.thereisaproblem msg=$LANG.supportticketinvalid textcenter=true}
			
			{else}
			
			    {if $closedticket}
			        {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.supportticketclosedmsg textcenter=true}
			    {/if}
			
			    {if $errormessage}
			        {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
			    {/if}
			
			{/if}
			
			<div class="w-964">
	            {foreach from=$descreplies key=num item=reply}
	                <div class="ticket-reply{if $reply.admin} reply-staff{/if}">
	                    <div class="reply-avatar avatar avatar-md">
	                        <img src="//gravatar.neworld.org/avatar/{$reply.email|md5}?s=100&d={$systemurl}templates/{$template}/assets/img/default_family.jpg"/>
	                    </div>  	
	                    <div class="reply-content">
	                        <div class="content-top">
	                            <span class="name">{$reply.name} <i class="zmdi zmdi-circle"></i></span>
	                            <span class="type{if $reply.admin} text-success{/if}">{if $reply.profession}{$reply.profession}{elseif $reply.admin}{$LANG.supportticketsstaff}{elseif $reply.contactid} {$LANG.supportticketscontact}{$LANG.supportticketsclient}{else}{$reply.email}{/if}<i class="zmdi zmdi-circle"></i></span>
	                            <span class="date">{$reply.date}</span>
	                            {if $reply.id && $reply.admin && $ratingenabled}
	                                {if $reply.rating}
	                                    <div class="rating-done">
	                                        {for $rating=1 to 5}
	                                            <span class="star{if (5 - $reply.rating) < $rating} active{/if}"></span>
	                                        {/for}
	                                        <div class="rated">{$LANG.ticketreatinggiven}</div>
	                                    </div>
	                                {else}
	                                    <div class="rating" ticketid="{$tid}" ticketkey="{$c}" ticketreplyid="{$reply.id}">
	                                        <span class="star" rate="5"></span>
	                                        <span class="star" rate="4"></span>
	                                        <span class="star" rate="3"></span>
	                                        <span class="star" rate="2"></span>
	                                        <span class="star" rate="1"></span>
	                                    </div>
	                                {/if}
	                            {/if}
	                        </div>
	                        <div class="content-body">
	                            {$reply.message}
	                        </div>
	                        {if $reply.attachments}
	                            <div class="content-attachments">
	                                <h6>{$LANG.supportticketsticketattachments}</h6>
	                                <ul class="attachments">
	                                    {foreach from=$reply.attachments key=num item=attachment}
	                                        <li><a href="dl.php?type={if $reply.id}ar&id={$reply.id}{else}a&id={$id}{/if}&i={$num}"><i class="zmdi zmdi-attachment-alt"></i>{$attachment}</a></li>
	                                            {/foreach}
	                                </ul>
	                            </div>
	                        {/if}
	                    </div>
	                </div>
	            {/foreach}
			</div>

            <div id="ticket-message" class="ticket-message">
                <h5>{$LANG.supportticketsreply}</h5>
                {if $errormessage}
                    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
                {/if}
                <form method="post" action="{$smarty.server.PHP_SELF}?tid={$tid}&amp;c={$c}&amp;postreply=true" enctype="multipart/form-data" role="form" id="frmReply">
                    {if !$loggedin}
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label for="inputName">{$LANG.supportticketsclientname}</label>
                                <input type="text" name="replyname" id="inputName" value="{$clientname}" class="form-control" {if $loggedin}disabled="disabled"{/if}/>
                            </div>
                            <div class="form-group col-sm-6">
                                <label for="inputEmail">{$LANG.supportticketsclientemail}</label>
                                <input type="email" name="replyemail" id="inputEmail" value="{$email}" class="form-control" {if $loggedin}disabled="disabled"{/if}/>
                            </div>
                        </div>
                    {else}
                        <input type="hidden" name="name" id="inputName" value="{$clientname}" />
                        <input type="hidden" name="email" id="inputEmail" value="{$email}" />
                    {/if}
                    <div class="message-textarea">
                        <textarea name="replymessage" id="inputMessage" rows="12" class="form-control markdown-editor" data-auto-save-name="client_ticket_reply_{$tid}">{$replymessage}</textarea>
                    </div>
                    <div class="message-actions">
		                <div class="message-attachments">
		                    <div class="row form-group">
						        <div class="col-sm-3">
						            <input type="file" name="attachments[]" id="inputAttachments" class="form-control" />
						            <div id="fileUploadsContainer"></div>
						        </div>
						        <div class="col-sm-2">
						            <button type="button" class="add-file-input btn btn-sm btn-default btn-outline" onclick="extraTicketAttachment()">
						                <i class="zmdi zmdi-plus"></i> {$LANG.addmore}
						            </button>
						        </div>
						        <div class="col-xs-12 ticket-attachments-message text-muted">
						            {$LANG.supportticketsallowedextensions}: {$allowedfiletypes}
						        </div>
						    </div>
		                </div>
				        <button type="submit" id="openTicketSubmit" class="btn btn-success">
				        	<span>{$LANG.supportticketsticketsubmit}</span>
				        </button>
		            </div>
                </form>
            </div>
        </div>
    </div>
{/if}