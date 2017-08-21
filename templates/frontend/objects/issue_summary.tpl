{**
 * templates/frontend/objects/issue_summary.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a summary for use in lists
 *
 * @uses $issue Issue The issue
 *}
{if $issue->getShowTitle()}
{assign var=issueTitle value=$issue->getLocalizedTitle()}
{/if}
{assign var=issueSeries value=$issue->getIssueSeries()}
{assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}

<div>

	{if $issueCover}
		<a>
			<img src="{$issueCover|escape}"{if $issue->getLocalizedCoverImageAltText() != ''} alt="{$issue->getLocalizedCoverImageAltText()|escape}"{/if}>
		</a>
	{/if}

	<a>
		{if $issueTitle}
			{$issueTitle|escape}
		{else}
			{$issueSeries|escape}
		{/if}
	</a>
	{if $issueTitle && $issueSeries}
		<div>
			{$issueSeries|escape}
		</div>
	{/if}

	<div>
		{$issue->getLocalizedDescription()|strip_unsafe_html}
	</div>
</div><!-- .obj_issue_summary -->
