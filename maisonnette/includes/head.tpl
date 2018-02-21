<!-- Styling -->
<link href="//fonts.cat.net/css?family=Open+Sans:300,400,600|Raleway:300,400,700" rel="stylesheet">
{* <link href="{$WEB_ROOT}/templates/{$template}/assets/css/all.css?v={$versionHash}" rel="stylesheet"> *}
<link href="{$WEB_ROOT}/templates/{$template}/assets/css/select2.min.css?v={$versionHash}" rel="stylesheet">
{* <link href="{$WEB_ROOT}/templates/{$template}/assets/css/theme.css?v={$versionHash}" rel="stylesheet"> *}
<link href="{$WEB_ROOT}/templates/{$template}/assets/css/app.min.css?v={$versionHash}" rel="stylesheet">
<link href="{$WEB_ROOT}/templates/{$template}/assets/css/font-awesome.min.css?v={$versionHash}" rel="stylesheet">
<link href="{$WEB_ROOT}/templates/{$template}/assets/css/fonts.css?v={$versionHash}" rel="stylesheet">
<link href="{$WEB_ROOT}/templates/{$template}/assets/css/custom.css?v=43" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<script type="text/javascript">
    var csrfToken = '{$token}',
        markdownGuide = '{lang key="markdown.title"}',
        locale = '{if !empty($mdeLocale)}{$mdeLocale}{else}en{/if}',
        saved = '{lang key="markdown.saved"}',
        saving = '{lang key="markdown.saving"}';
</script>
<script src="{$WEB_ROOT}/templates/{$template}/assets/js/scripts.min.js?v={$versionHash}"></script>
<script src="{$WEB_ROOT}/templates/{$template}/assets/js/dashboard.js?v=6"></script>
<script src="//cdnjs.neworld.org/ajax/libs/flot/0.8.3/jquery.flot.min.js"></script>

{if $templatefile == "viewticket" && !$loggedin}
  <meta name="robots" content="noindex" />
{/if}
