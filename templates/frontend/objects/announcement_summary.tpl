{**
 * templates/frontend/objects/announcement_summary.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a summary view of an announcement
 *
 * @uses $announcement Announcement The announcement to display
 * @uses $heading string HTML heading element, default: h2
 *}
{if !$heading}
	{assign var="heading" value="h2"}
{/if}

<article class="announcement-summary">
	<{$heading}>
		<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->id}">
			{$announcement->getLocalizedData('title')|escape}
		</a>
	</{$heading}>
	<div class="announcement-summary-date">
		{$announcement->datePosted|date_format:$dateFormatLong}
	</div>
	<div class="announcement-summary-description">
		{$announcement->getLocalizedData('descriptionShort')|strip_unsafe_html}
		<p class="announcement-summary-more">
			<a class="btn" href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->id}">
				<span aria-hidden="true" role="presentation">{translate key="common.readMore"}</span>

				{* Screen readers need more context *}
				<span class="visually-hidden">
					{translate key="common.readMoreWithTitle" title=$announcement->getLocalizedData('title')|escape}
				</span>
			</a>
		</p>
	</div>
</article>
