{**
 * templates/frontend/pages/navigationMenuItemViewContent.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display NavigationMenuItem custom page content
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$title}

<div class="container page-about">
	<div class="page-header">
		<h1>{$title|escape}</h1>
	</div>
	<div class="row justify-content-md-center">
		<div class="col-md-8">
			<div class="page-content">
				{$content}
			</div>
		</div>
	</div>
</div>

{include file="frontend/components/footer.tpl"}
