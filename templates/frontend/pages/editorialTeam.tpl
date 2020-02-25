{**
 * templates/frontend/pages/editorialTeam.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the editorial team.
 *
 * @uses $currentContext Journal|Press The current journal or press
 *}
{include file="frontend/components/header.tpl" pageTitle="about.editorialTeam"}

<div class="container page-editorial-team">
	<div class="row page-header justify-content-md-center">
		<div class="col-md-8">
			<h1>{translate key="about.editorialTeam"}</h1>
		</div>
	</div>
	<div class="row justify-content-md-center">
		<div class="col-md-8">
			<div class="page-content">
				{$currentContext->getLocalizedSetting('editorialTeam')}
				{include file="frontend/components/editLink.tpl" page="management" op="settings" path="context" anchor="masthead" sectionTitleKey="about.editorialTeam"}
			</div>
		</div>
	</div>
</div>

{include file="frontend/components/footer.tpl"}
