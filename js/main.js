/**
 * @file /js/main.js
 *
 * Copyright (c) 2014-2020 Simon Fraser University
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

	// Show author affiliation under authors list (for large screen only)
	var authorString = $('.author-string-href');
	$(authorString).click(function(event) {
		event.preventDefault();
		var elementId = $(this).attr('href').replace('#', '');
		$('.article-details-author').each(function () {

			// Show only targeted author's affiliation on click
			if ($(this).attr('id') === elementId && $(this).hasClass('hideAuthor')) {
				$(this).removeClass('hideAuthor');
			} else {
				$(this).addClass('hideAuthor');
			}

			// Add specifiers to the clicked author's link
			$(authorString).each(function () {
				if ($(this).attr('href') === ('#' + elementId) && !$(this).hasClass('active')){
					$(this).addClass('active');
					$(this).children('.author-plus').addClass('hide');
					$(this).children('.author-minus').removeClass('hide');
				} else if ($(this).attr('href') !== ('#' + elementId) || $(this).hasClass('active')) {
					$(this).removeClass('active');
					$(this).children('.author-plus').removeClass('hide');
					$(this).children('.author-minus').addClass('hide');
				}
			});
		})
	})
})(jQuery);


// initiating tag-it
$(document).ready(function() {
	$('#tagitInput').each(function() {
		var autocomplete_url = $(this).data('autocomplete-url');
		$(this).tagit({
			fieldName: $(this).data('field-name'),
			allowSpaces: false,
			autocomplete: {
				source: function(request, response) {
					$.ajax({
						url: autocomplete_url,
						data: {term: request.term},
						dataType: 'json',
						success: function(jsonData) {
							if (jsonData.status == true) {
								response(jsonData.content);
							}
						}
					});
				},
			},
		});
	});
});

(function () {
	/**
	 * Determine if the user has opted to register as a reviewer
	 *
	 * @see: /templates/frontend/pages/userRegister.tpl
	 */
	function isReviewerSelected() {
		var group = $('#reviewerOptinGroup').find('input');
		var is_checked = false;
		group.each(function() {
			if ($(this).is(':checked')) {
				is_checked = true;
				return false;
			}
		});

		return is_checked;
	}

	/**
	 * Reveal the reviewer interests field on the registration form when a
	 * user has opted to register as a reviewer
	 *
	 * @see: /templates/frontend/pages/userRegister.tpl
	 */
	function reviewerInterestsToggle() {
		var is_checked = isReviewerSelected();
		if (is_checked) {
			$('#reviewerInterests').removeClass('hidden');
		} else {
			$('#reviewerInterests').addClass('hidden');
		}
	}

	// Update interests on page load and when the toggled is toggled
	reviewerInterestsToggle();
	$('#reviewerOptinGroup input').click(reviewerInterestsToggle);
})();

// change article's blocks logic for small screens

(function () {

	var mainArticleContent = $("#mainArticleContent");

	if (mainArticleContent.length === 0) return false;

	var articleDetailsWrapper = $("#articleDetailsWrapper");
	var articleDetails = $("#articleDetails");
	var articleDetailsChildren = articleDetails.children();

	var articleMainWrapper = $("#articleMainWrapper");
	var articleMain = $("#articleMain");
	var articleMainChildren = articleMain.children();

	var dataForMobilesMark = "data-for-mobiles";

	function reorganizeArticleBlocks() {
		if (mainArticleContent && !mainArticleContent.hasClass(dataForMobilesMark) && window.innerWidth < 992) {
			$("#articleDetails").unwrap();
			$("#articleMain").unwrap();

			articleDetailsChildren.unwrap();
			articleMainChildren.unwrap();

			mainArticleContent.children().wrapAll("<div class='col-lg article-blocks-mobile'></div>");

			mainArticleContent.addClass(dataForMobilesMark);

		} else if (mainArticleContent && mainArticleContent.hasClass(dataForMobilesMark) && window.innerWidth >= 992) {
			$('#mainArticleContent > *').children().unwrap();

			articleDetailsChildren.wrapAll(articleDetails);
			articleMainChildren.wrapAll(articleMain);

			$("#articleDetails").wrap(articleDetailsWrapper);
			$("#articleMain").wrap(articleMainWrapper);


			mainArticleContent.removeClass(dataForMobilesMark);
		}
	}

	reorganizeArticleBlocks();

	window.addEventListener("resize", function () {
		reorganizeArticleBlocks();
	});
})();

// Functionality of more/less buttons for the journal description (index journal page)

(function () {
	var journalDescription = document.getElementById('homepageDescription');

	if (!journalDescription) return false;

	var moreButton = document.getElementById('homepageDescriptionMore');
	var lessButton = document.getElementById('homepageDescriptionLess');
	var descriptionButtons = document.getElementById('homepageDescriptionButtons');

	if (journalDescription.offsetHeight < journalDescription.scrollHeight) {
		moreButton.classList.remove('hidden');
		descriptionButtons.classList.remove('hidden');
	}

	moreButton.onclick = function () {
		journalDescription.classList.remove('long-text');
		this.classList.add('hidden');
		lessButton.classList.remove('hidden');
	};

	lessButton.onclick = function () {
		journalDescription.classList.add('long-text');
		this.classList.add('hidden');
		moreButton.classList.remove('hidden');
	};
})();

// Toggle display of consent checkboxes in site-wide registration
var $contextOptinGroup = $('#contextOptinGroup');
if ($contextOptinGroup.length) {
	var $roles = $contextOptinGroup.find('.roles :checkbox');
	$roles.change(function() {
		var $thisRoles = $(this).closest('.roles');
		if ($thisRoles.find(':checked').length) {
			$thisRoles.siblings('.context_privacy').addClass('context_privacy_visible');
		} else {
			$thisRoles.siblings('.context_privacy').removeClass('context_privacy_visible');
		}
	});
}
