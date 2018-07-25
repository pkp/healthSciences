{**
 * templates/frontend/pages/announcement.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page which represents a single announcement
 *
 * @uses $announcement Announcement The announcement to display
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$announcement->getLocalizedTitle()}

<article class="container page-announcement">
	<div class="row page-header justify-content-md-center">
		<div class="col-md-8">
		    <div class="announcement-date">
		      {$announcement->getDatePosted()|date_format:$dateFormatLong}
		    </div>
			<h1>{$announcement->getLocalizedTitle()}</h1>
		</div>
	</div>
	<div class="row justify-content-md-center">
		<div class="col-md-8">
			<article class="page-content">
    		{if $announcement->getLocalizedDescription()}
    			{$announcement->getLocalizedDescription()|strip_unsafe_html}
    		{else}
    			{$announcement->getLocalizedDescriptionShort()|strip_unsafe_html}
    		{/if}
			</article>
		</div>
	</div>
</article>

{include file="frontend/components/footer.tpl"}
