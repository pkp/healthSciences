/**
 * @file /js/main.js
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2000-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Handle JavaScript functionality unique to this theme.
 */
(function($) {

	// Open login modal when nav menu links clicked
	$('.nmi_type_user_login').click(function() {
		$('#loginModal').modal();
		return false;
	})
})(jQuery);

(function ($) {
	
	// Show author affiliation in the sidebar on author string click
	$('.author-string-href').click(function(event) {
		event.preventDefault();
		var elementId = $(this).attr('href').replace('#', '');
		$('.article-details-author').each(function () {
			$(this).addClass('hideAuthor');
			if ($(this).attr('id') === elementId) {
				$(this).removeClass('hideAuthor');
			}
		})
	})
})(jQuery);
