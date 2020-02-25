{**
 * templates/frontend/pages/information.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view a journal's or press's description, contact
 *  details, policies and more.
 *
 * @uses $currentContext Journal|Press The current journal or press
 *}
{include file="frontend/components/header.tpl" pageTitle=$pageTitle}

<div class="container page-information">
	<div class="row page-header justify-content-md-center">
		<div class="col-md-8">
			<h1>{translate key=$pageTitle}</h1>
		</div>
	</div>
	<div class="row justify-content-md-center">
		<div class="col-md-8">
			<div class="page-content">
				{$content}
				<p>
					{include file="frontend/components/editLink.tpl" page="management" op="settings" path="website" anchor="information" sectionTitleKey="manager.website.information"}
				</p>
			</div>
		</div>
	</div>
</div>

{include file="frontend/components/footer.tpl"}
