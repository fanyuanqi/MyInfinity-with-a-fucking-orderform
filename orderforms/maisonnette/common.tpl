<link rel="stylesheet" type="text/css" href="{$WEB_ROOT}/templates/orderforms/{$carttpl}/css/all.min.css?v={$versionHash}" />
<link rel="stylesheet" type="text/css" href="//cdnjs.neworld.org/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css" />
<link rel="stylesheet" type="text/css" href="{$WEB_ROOT}/templates/orderforms/{$carttpl}/css/style.css?v=1{$versionHash}" />
<script type="text/javascript" src="{$WEB_ROOT}/templates/orderforms/{$carttpl}/js/scripts.min.js?v={$versionHash}"></script>
<script type="text/javascript">
$(function () {
	$(window).scroll(function () {
        ($(this).scrollTop() > 140) ? $('.page-navbar').addClass('affix'): $('.page-navbar').removeClass('affix');
    });
    $('.preview-cart-badge').mouseover(function () {
		$(this).addClass('active');
		$('.cart-dropdown').addClass('open');
	});
	
    $('.preview-cart-badge').mouseout(function () {
	    $('.cart-dropdown').mouseover(function () {
			$('.preview-cart-badge').removeClass('active');
			$('.cart-dropdown').addClass('open');
		});
	    $('.cart-dropdown').mouseout(function () {
			$(this).removeClass('open');
		});
		$('.cart-dropdown').removeClass('open');
	});
});
</script>