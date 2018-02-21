<!DOCTYPE html>
<html lang="{$LANG.locale}">
<head>
    <meta charset="{$charset}" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>

    {include file="$template/includes/head.tpl"}

    {$headoutput}

</head>
<body {if $templatefile eq "login" or $templatefile eq "pwreset"}class="mai-splash-screen"{/if}>

{$headeroutput}

{if $templatefile ne "login" and $templatefile ne "pwreset"}
		<!--Header Start-->
		{include file="$template/includes/common/header.tpl"}
		
	{if $templatefile ne "homepage" and $filename eq "clientarea" or $filename eq "affiliates" or $filename eq "supporttickets" or $filename eq "viewticket"}
		<!--Navbar Start-->
		{include file="$template/includes/common/navbar.tpl"}
	{/if}
	
{/if}

<div class="mai-wrapper {if $templatefile eq "login"}mai-login{elseif $templatefile eq "pwreset"}mai-forgot-password{/if}">
	
	{include file="$template/includes/verifyemail.tpl"}
