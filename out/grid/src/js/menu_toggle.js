
/*Mobile Navigation aktivieren*/
jQuery(function ($) {
	$('.nav-toggler__button').on('click', function(e) {
		e.preventDefault();
		$('.nav--mobile').toggleClass('nav--mobile--active');
		$('html').toggleClass('html--fixed');
	});
});

