{**
 * templates/frontend/pages/issueArchive.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a list of recent issues.
 *
 * @uses $issues Array Collection of issues to display
 * @uses $prevPage int The previous page number
 * @uses $nextPage int The next page number
 * @uses $showingStart int The number of the first item on this page
 * @uses $showingEnd int The number of the last item on this page
 * @uses $total int Count of all published monographs
 *}
{capture assign="pageTitle"}
	{if $prevPage}
		{translate key="archive.archivesPageNumber" pageNumber=$prevPage+1}
	{else}
		{translate key="archive.archives"}
	{/if}
{/capture}
{include file="frontend/components/header.tpl" pageTitleTranslated=$pageTitle}

<div class="container page-archives">

	<div class="page-header page-archives-header">
		<h1>{$pageTitle|escape}</h1>
	</div>

	{* No issues have been published *}
	{if empty($issues)}
		<div class="page-header page-issue-header">
			{include file="frontend/components/notification.tpl" messageKey="current.noCurrentIssueDesc"}
		</div>

	{* List issues *}
	{else}
		{foreach $issues as $issue}
			{* @iteration starts from 1 *}
			{if ($issue@iteration) % 4 == 1}
				<div class="row justify-content-around">
			{/if}
			<div class="col-md-3 col-lg-2">
				{include file="frontend/objects/issue_summary.tpl" heading="h2"}
			</div>
			{* Insert empty columns to keep columns aligned even on the last row *}
			{if $issue@last && ($issue@iteration) % 4 != 0}
				{assign var="emptyCols" value=4 - ($issue@iteration) % 4}
				{section name="empty" start=0 loop=$emptyCols}
					<div class="col-md-3 col-lg-2"></div>
				{/section}
    		{/if}
			{* Either end of row or last issue *}
			{if ($issue@iteration) % 4 == 0 || $issue@last}
				</div>
			{/if}

		{/foreach}

		{* Pagination *}
		{capture assign="prevUrl"}
			{if $prevPage > 1}
				{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive" path=$prevPage}
			{elseif $prevPage === 1}
				{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}
			{/if}
		{/capture}
		{capture assign="nextUrl"}
			{if $nextPage}
				{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive" path=$nextPage}
			{/if}
		{/capture}
		{include
			file="frontend/components/pagination.tpl"
			prevUrl=$prevUrl|trim
			nextUrl=$nextUrl|trim
			showingStart=$showingStart
			showingEnd=$showingEnd
			total=$total
		}
	{/if}
</div>


{include file="frontend/components/footer.tpl"}
