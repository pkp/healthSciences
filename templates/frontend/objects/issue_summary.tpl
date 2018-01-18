{**
 * templates/frontend/objects/issue_summary.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a summary for use in lists
 *
 * @uses $issue Issue The issue
 * @uses $heading string The HTML tag to use for each issue title.
 *}

<div class="card issue-summary">
	{if $issue->getLocalizedCoverImageUrl()}
		<a href="{url op="view" path=$issue->getBestIssueId()}">
			<img class="card-img-top issue-summary-cover" src="{$issue->getLocalizedCoverImageUrl()|escape}"{if $issue->getLocalizedCoverImageAltText() != ''} alt="{$issue->getLocalizedCoverImageAltText()|escape}"{/if}>
		</a>
	{/if}
	<div class="card-body">
		<{$heading} class="card-title issue-summary-series">
			<a href="{url op="view" path=$issue->getBestIssueId()}">
				{$issue->getIssueSeries()|escape}
			</a>
		</{$heading}>
		{if $issue->getShowTitle() && $issue->getLocalizedTitle()}
			<div class="card-text">
				<p class="issue-summary-date">{$issue->getDatePublished()|date_format:$dateFormatLong}</p>
				<p class="issue-summary-title">{$issue->getLocalizedTitle()|escape}</p>
			</div>
		{/if}
	</div>
</div>
