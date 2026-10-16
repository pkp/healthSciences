{**
 * templates/frontend/pages/editorialMastheadDisabled.tpl
 *
 * Copyright (c) 2026 Simon Fraser University
 * Copyright (c) 2026 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display context's editorial masthead page when the enrollment-based masthead is disabled.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="common.editorialMasthead"}

<div class="container page page-masthead">
	<div class="page-header">
		<h1>{translate key="common.editorialMasthead"}</h1>
	</div>

	<div class="row justify-content-md-center">
		<div class="col-md-6">
			<div class="page-content">
				{$currentContext->getLocalizedData('editorialHistory')}
				{include file="frontend/components/editLink.tpl" page="management" op="settings" path="context" anchor="masthead" sectionTitleKey="common.editorialMasthead"}
			</div>
		</div>
	</div>
</div>

{include file="frontend/components/footer.tpl"}
