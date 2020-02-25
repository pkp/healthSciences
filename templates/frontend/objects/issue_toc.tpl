{**
 * templates/frontend/objects/issue_toc.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a full table of contents.
 *
 * @uses $issue Issue The issue
 * @uses $issueTitle string Title of the issue. May be empty
 * @uses $issueSeries string Vol/No/Year string for the issue
 * @uses $issueGalleys array Galleys for the entire issue
 * @uses $hasAccess bool Can this user access galleys for this context?
 * @uses $publishedSubmissions array Lists of articles published in this issue
 *   sorted by section.
 * @uses $primaryGenreIds array List of file genre ids for primary file types
 * @uses $sectionHeading string Tag to use (h2, h3, etc) for section headings
 *}
<div class="issue-toc">

	{foreach name=sections from=$publishedSubmissions item=section}
		<div class="issue-toc-section">
			{if $section.articles}
				{if $section.title}
					<{$sectionHeading} class="issue-toc-section-title">{$section.title|escape}</{$sectionHeading}>
				{/if}
				{foreach from=$section.articles item=article}
					{include file="frontend/objects/article_summary.tpl"}
				{/foreach}
			{/if}
		</div>
	{/foreach}
</div>
