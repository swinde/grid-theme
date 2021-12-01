
/*Mobile Navigation aktivieren*/
jQuery(function ($) {
	$('.nav-toggler__button').on('click', function(e) {
		e.preventDefault();
		$('.nav--mobile').toggleClass('nav--mobile--active');
		$('html').toggleClass('html--fixed');
	});
});
/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */
function myFunction() {
	document.getElementsByClassName("dropdown-menu").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
	if (!event.target.matches('.dropdown-toggle')) {
		var dropdowns = document.getElementsByClassName("dropdown-content");
		var i;
		for (i = 0; i < dropdowns.length; i++) {
			var openDropdown = dropdowns[i];
			if (openDropdown.classList.contains('show')) {
				openDropdown.classList.remove('show');
			}
		}
	}
}