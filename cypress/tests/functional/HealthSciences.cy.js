/**
 * @file cypress/tests/functional/HealthSciences.spec.js
 *
 * Copyright (c) 2014-2025 Simon Fraser University
 * Copyright (c) 2000-2025 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 */

describe('Theme plugin tests', function() {
	const journalPath = 'publicknowledge';
	const index = 'index.php';
	const path = '/' + index + '/' + journalPath + '/en';

	const date = new Date();
	const day = date.getDate() + '';
	const month = (function() {
		let numericMonth = (date.getMonth() + 1) + '';
		if ([...numericMonth].length === 1) {
			numericMonth = '0' + numericMonth;
		}
		return numericMonth;
	})();
	const year = date.getFullYear() + '';

	const user = {
		'givenName': 'John',
		'familyName': 'Debreenik',
		'username': 'jdebreenik',
		'country': 'UA',
		'affiliation': 'Lorem Ipsum University'
	};

	const journalDescription = 'Sed elementum ligula sit amet velit gravida fermentum. Ut mi risus, dapibus nec tincidunt eget, tincidunt eget nulla.';
	const categoryDescription = 'Maecenas imperdiet sodales ligula et tempor. Phasellus urna sem, efficitur sed nisi egestas, lacinia elementum quam.';

	it('Enables and selects the theme', function() {
		cy.login('admin', 'admin', 'publicknowledge');

		cy.get('nav').contains('Settings').click();
		// Ensure submenu item click despite animation
		cy.get('nav').contains('Website').click({ force: true });
		cy.get('button[id="plugins-button"]').click();

		// Find and enable the plugin
		cy.get('input[id^="select-cell-healthsciencesthemeplugin-enabled"]').click();
		cy.get('div:contains(\'The plugin "Health Sciences Theme" has been enabled.\')');
		cy.reload();

		// Select the Health Sciences theme
		cy.get('button[id="appearance-button"]').click();
		cy.get('select[id="theme-themePluginPath-control"]').select('healthSciences');
		cy.get('#theme button').contains('Save').click();
		cy.get('#theme [role="status"]').contains('Saved');
	});

	it('Visits front-end theme pages', function() {
		cy.visit(path);
		cy.visit(path + '/issue/current');
		cy.visit(path + '/issue/archive');
		cy.visit(path + '/issue/view/1');
		cy.visit(path + '/article/view/1');
		cy.visit(path + '/article/view/1/1');
		cy.visit(path + '/about');
		cy.visit(path + '/about/editorialMasthead');
		cy.visit(path + '/about/submissions');
		cy.visit(path + '/about/contact');
		cy.visit(path + '/about/privacy');
		cy.visit(path + '/information/readers');
		cy.visit(path + '/information/authors');
		cy.visit(path + '/information/librarians');
	});

	it('Checks theme options', function() {
		cy.login('admin', 'admin', journalPath);
		cy.visit(path + '/management/settings/website');
		cy.get('#appearance-button').click();
		cy.get('#theme-button').click();
		cy.get('input.vc-input__input').first().clear().type('#AAAAAA');
		cy.get('#theme button').contains('Save').click();
		cy.get('#theme [role="status"]').contains('Saved');

		// Populate journal summary
		cy.get('nav').contains('Journal').click();
		cy.get('#masthead-button').click();
		cy.setTinyMceContent('masthead-description-control-en', journalDescription);
		cy.get('#masthead button').contains('Save').click();
		cy.get('#masthead [role="status"]').contains('Saved');

		// Check if applied
		cy.visit(path + '/issue/view/1');
		cy.get('.btn-primary').contains('PDF').should('have.css', 'background-color', 'rgb(170, 170, 170)');
	});

	it('Checks category pages & publication versioning', function() {
		cy.login('admin', 'admin', journalPath);
		cy.visit(path + '/management/settings/context');
		cy.get('button').contains('Categories').click();
		cy.get('#categoriesContainer a').contains('Add Category').click();
		cy.waitJQuery();
		cy.get('#categoryDetails').within(() => {
			cy.get('input[name="name[en]"]').click().type('First category', {delay: 0});
			cy.get('input[name="path"]').click().type('first-category', {delay: 0});
			cy.get('textarea[name="description[en]"]').then(node => {
				cy.setTinyMceContent(node.attr('id'), categoryDescription);
			});
			cy.get('button').contains('OK').click();
		});
		cy.waitJQuery();
		cy.visit('/index.php/publicknowledge/workflow/access/1');
		cy.waitJQuery();
		cy.get(`[data-cy="active-modal"] nav a:contains('Issue')`).click();

		cy.get('.pkpFormField--options__optionLabel').contains('First category').click();
		cy.get('button').contains('Save').click();
		cy.get('[role="status"]').contains('Saved');

		cy.get(`[data-cy="active-modal"] nav a:contains('Title & Abstract')`).click();
		cy.getTinyMceContent('titleAbstract-title-control-en').then((content) => {
			cy.setTinyMceContent('titleAbstract-title-control-en', content + ' - version 2');
		});
		cy.get('button').contains('Save').click();
		cy.get('[role="status"]').contains('Saved');
		cy.get('button').contains('Publish').click();
		cy.get('.pkpWorkflow__publishModal button').contains('Publish').click();
		cy.wait(2000);

		// Visit front-end pages
		cy.visit(path + '/article/view/1');
		cy.get('.article-details-fulltitle').invoke('text').then((text) => {
			expect(text).to.include('version 2');
		});
		cy.get('.article-details-heading').contains('Versions').next('ul').children().should('have.length', 2);
		cy.visit(path + '/article/view/1/version/1');
		cy.get('.article-details-fulltitle').invoke('text').then((text) => {
			expect(text).not.to.include('version 2');
		});
		cy.visit(path + '/article/view/1/version/1/1');
		cy.visit(path + '/catalog/category/first-category');
		cy.get('.page-category-count').contains('1 Items');
		cy.get('.category-toc').children().should('have.length', 1);
	});

	it('Search an article', function() {
		cy.visit(path + '/' + 'search' + '/' + 'search');
		cy.get('input[id="query"]').type('Antimicrobial', {delay: 0});

		// Search from the first day of the current month till now
		cy.get('select[name="dateFromYear"]').select(year);
		cy.get('select[name="dateFromMonth"]').select(month);
		cy.get('select[name="dateFromDay"]').select('1');
		cy.get('select[name="dateToYear"]').select(year);
		cy.get('select[name="dateToMonth"]').select(month);
		cy.get('select[name="dateToDay"]').select(day);

		cy.get('input[name="authors"]').type('Vajiheh Karbasizaed', {delay: 0});
		cy.get('button[type="submit"]').contains('Search').click();
		cy.get('.search-results').children().should('have.length', 2);
		cy.get('.article-summary-title a').first().click();
		cy.wait(200);
		cy.url().should('include', 'article/view/1');
	});

	it('Register a user', function() {
		// Sign out
		cy.visit(path + '/' + 'login/signOut');
		cy.url().should('include', 'login');

		// Register; 'cy.register()' command won't work for this theme because points to the wrong Register nav link
		cy.get('#userNav a').contains('Register').click();
		cy.url().should('include', '/user/register');
		cy.get('#givenName').type(user.givenName, {delay: 0});
		cy.get('#familyName').type(user.familyName, {delay: 0});
		cy.get('#affiliation').type(user.affiliation, {delay: 0});
		cy.get('#country').select(user.country);
		cy.get('#username').type(user.username, {delay: 0});
		cy.get('#email').type(user.username + '@mailinator.com', {delay: 0});
		cy.get('#password').type(user.username + user.username, {delay: 0});
		cy.get('#password2').type(user.username + user.username, {delay: 0});
		cy.get('input[name="privacyConsent"]').check();
		cy.get('.reviewer .form-check-label').click();
		cy.get('#reviewerInterests input').type('psychotherapy,neuroscience,neurobiology', {delay: 0});
		cy.get('#register button[type="submit"]').contains('Register').click();
		cy.get('a').contains('View Submissions').click();
		cy.url().should('include', 'dashboard');
	});

	it('Log out/Log in', function() {
		// Sign out
		cy.visit(path + '/' + 'login/signOut');
		cy.url().should('include', 'login');
		cy.get('#username').type('dbarnes', {delay: 0});
		cy.get('#password').type('dbarnesdbarnes');
		cy.get('button[type="submit"]').contains('Login').click();
		cy.url().should('include', 'dashboard');
	});
});
