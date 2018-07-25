{**
 * templates/frontend/pages/privacy.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the privacy policy.
 *
 * @uses $currentContext Journal|Press The current journal or press
 *}
{include file="frontend/components/header.tpl" pageTitle="manager.setup.privacyStatement"}

<div class="container page-privacy">
	<div class="page-header">
		<h1>{translate key="manager.setup.privacyStatement"}</h1>
	</div>
	<div class="row justify-content-md-center">
		<div class="col-md-8">
			<div class="page-content">
				{$currentContext->getLocalizedSetting('privacyStatement')}
			</div>
		</div>
	</div>
</div>

{include file="frontend/components/footer.tpl"}
