/**
 * @file /js/main.js
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2000-2023 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Handle JavaScript functionality unique to this theme.
 */
(function () {

	// Open login modal when nav menu links clicked
	document.querySelectorAll('.nmi_type_user_login').forEach((userLogin) => {
		userLogin.addEventListener('click', function (event) {
			event.preventDefault();
			const loginModal = new bootstrap.Modal('#loginModal');
			loginModal.show();
		});
	});
})();

(function () {
	const pageArticle = document.querySelector('.page-article');
	if (!pageArticle) {
		return;
	}

	// Show author affiliation under authors list (for large screen only)
	const authorLinks = document.querySelectorAll('.author-string-href');
	authorLinks.forEach(function (authorLink) {
		authorLink.addEventListener('click', function (event) {
			event.preventDefault();
			const elementId = this.getAttribute('href').replace('#', '');
			document.querySelectorAll('.article-details-author').forEach((details) => {

				// Show only targeted author's affiliation on click
				if (details.getAttribute('id') === elementId && details.classList.contains('hideAuthor')) {
					details.classList.remove('hideAuthor');
				} else {
					details.classList.add('hideAuthor');
				}
			});

			// Add specifiers to the clicked author's link
			authorLinks.forEach((sibling) => {
				if (authorLink === sibling && !sibling.classList.contains('active')) {
					sibling.classList.add('active');
					sibling.querySelector('.author-plus').classList.add('hidden');
					sibling.querySelector('.author-minus').classList.remove('hidden');
				} else {
					sibling.classList.remove('active');
					sibling.querySelector('.author-plus').classList.remove('hidden');
					sibling.querySelector('.author-minus').classList.add('hidden');
				}
			});
		});
	});
})();

(function() {
	if (!document.querySelector('.page-register')) {
		return;
	}

	const checkboxReviewerInterests = document.querySelector('#reviewerOptinGroup input[type="checkbox"]');
	if (!checkboxReviewerInterests) {
		return;
	}

	/**
	 * Reveal the reviewer interests field on the registration form when a
	 * user has opted to register as a reviewer
	 *
	 * @see: /templates/frontend/pages/userRegister.tpl
	 */
	function reviewerInterestsToggle() {
		if (checkboxReviewerInterests.checked) {
			document.getElementById('reviewerInterests').classList.remove('hidden');
		} else {
			document.getElementById('reviewerInterests').classList.add('hidden');
		}
	}

	// Update interests on page load and when the toggled is toggled
	reviewerInterestsToggle();
	checkboxReviewerInterests.addEventListener('click', reviewerInterestsToggle);
})();

// change article's blocks logic for small screens

(function () {

	const mainArticleContent = document.getElementById('mainArticleContent');
	if (!mainArticleContent) {
		return;
	}

	const articleDetailsWrapper = document.getElementById('articleDetailsWrapper');
	const articleDetails = document.getElementById('articleDetails');
	let articleDetailsChildren = articleDetails.children;

	const articleMainWrapper = document.getElementById('articleMainWrapper');
	const articleMain = document.getElementById('articleMain');
	let articleMainChildren = articleMain.children;

	const dataForMobilesMark = "data-for-mobiles";

	function reorganizeArticleBlocks() {
		if (mainArticleContent && !mainArticleContent.classList.contains(dataForMobilesMark) && window.innerWidth < 992) {
			const detailsClone = [].concat(...articleDetailsChildren);
			const mainClone = [].concat(...articleMainChildren);
			const articleBlockMobile = document.createElement('div');
			articleBlockMobile.classList.add('col-lg', 'article-blocks-mobile');
			articleBlockMobile.append(...articleDetailsChildren, ...articleMainChildren);

			while (mainArticleContent.lastElementChild) {
				mainArticleContent.removeChild(mainArticleContent.lastElementChild);
			}
			mainArticleContent.appendChild(articleBlockMobile);

			articleDetailsChildren = detailsClone;
			articleMainChildren = mainClone;
			mainArticleContent.classList.add(dataForMobilesMark);
		} else if (mainArticleContent && mainArticleContent.classList.contains(dataForMobilesMark) && window.innerWidth >= 992) {
			while (mainArticleContent.lastElementChild) {
				mainArticleContent.removeChild(mainArticleContent.lastElementChild);
			}

			mainArticleContent.appendChild(articleDetailsWrapper);
			articleDetailsWrapper.appendChild(articleDetails);
			articleDetails.append(...articleDetailsChildren);

			mainArticleContent.appendChild(articleMainWrapper);
			articleMainWrapper.appendChild(articleMain);
			articleMain.append(...articleMainChildren);

			mainArticleContent.classList.remove(dataForMobilesMark);
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
(function () {
	const contextOptinGroup = document.getElementById('contextOptinGroup');
	if (!contextOptinGroup) {
		return;
	}

	const privacyVisible = 'context_privacy_visible';

	contextOptinGroup.querySelectorAll(':scope .list-group-item').forEach((context) => {
		const roleInputs = context.querySelectorAll(':scope .roles input[type=checkbox]');
		roleInputs.forEach((roleInput) => {
			roleInput.addEventListener('change', function () {
				const contextPrivacy = context.querySelector('.context_privacy');
				if (!contextPrivacy) {
					return;
				}

				if (this.checked) {
					if (!contextPrivacy.classList.contains(privacyVisible)) {
						contextPrivacy.classList.add(privacyVisible);
						return;
					}
				}

				for (let i = 0; i < roleInputs.length; i++) {
					const sibling = roleInputs[i];
					if (sibling === roleInput) {
						continue;
					}
					if (sibling.checked) {
						return;
					}
				}

				contextPrivacy.classList.remove(privacyVisible);
			});
		});
	});
})();
