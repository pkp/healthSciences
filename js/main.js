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


// initiating tag-it
$(document).ready(function() {
	$("#tagitInput").tagit();
});

(function () {
	var checkbox = document.getElementsByClassName("if-reviewer-checkbox")[0];
	if (checkbox != null) {
		checkbox.onclick = function () {
			var tagitInput = document.getElementById("reviewerInterests");
			if (checkbox.checked == true) {
				tagitInput.classList.remove("hidden");
			} else {
				tagitInput.classList.add("hidden");
			}
		}
	}
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
			
			mainArticleContent.addClass(dataForMobilesMark);
			
		} else if (mainArticleContent && mainArticleContent.hasClass(dataForMobilesMark) && window.innerWidth >= 992) {
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