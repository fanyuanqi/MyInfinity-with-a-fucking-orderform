jQuery(document).ready(function() {
	
	jQuery(".mai-sub-header .navbar-toggleable-sm .navbar-nav .nav-item:first").addClass('open');
	
	// Left-Menu
    jQuery(".mai-sub-header .navbar-toggleable-sm .navbar-nav .nav-sub.parent > .nav-link").click(function(e) {
		jQuery(this).parent().toggleClass("open").find("> .submenu").slideToggle(500).end().siblings().removeClass("open").find("> .submenu").slideUp(500), e.preventDefault();
    });
    
    //Clipboard
	var clipboard = new Clipboard('.input-copy .btn');

	clipboard.on('success', function(e) {
	    $('.input-copy .btn span').addClass('not-visible');
	    $('.input-copy .check-animate').removeClass('hidden');
	    $('.copy-message').removeClass('hidden');
	
	    e.clearSelection();
	});
    
	// BootStrap Modal
	$('body').append($('#modalAjax'));
	
	//Select2
	$('select').select2({
		minimumResultsForSearch: Infinity
	});
    
    $('.cards-carousel').each(function () {
        var
            $this = $(this)
            , $cards = $this.find('.cards');
        var slider = $cards.lightSlider({
            item: 1
            , loop: false
            , slideMove: 1
            , slideMargin: 0
            , easing: 'cubic-bezier(0.25, 0, 0.25, 1)'
            , speed: 600
            , onBeforeSlide: function (el) {
                var
                    current = (el.getCurrentSlideCount() + slider.find('.clone').length / 2)
                    , pageCurrent = (current - 1) * 4 + $cards.find('> li:nth-child(' + current + ') > a').length;
                $this.find('.number-current').html(pageCurrent);
            }
        });
        $this.find('.card-prev').click(function () {
            slider.goToPrevSlide();
        });
        $this.find('.card-next').click(function () {
            slider.goToNextSlide();
        });
    });
});