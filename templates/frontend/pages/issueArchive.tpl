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
		<h1>{$pageTitle}</h1>
	</div>

	{* No issues have been published *}
	{if empty($issues)}
		<div class="page-header page-issue-header">
			{include file="frontend/components/notification.tpl" messageKey="current.noCurrentIssueDesc"}
		</div>

	{* List issues *}
	{else}
		{foreach from=$issues item="issue" key="i"}
			{if $i % 4 == 0 && $i > 0}
				</div>
				{assign var="open" value=false}
			{/if}
			{if $i % 4 == 0}
				<div class="row justify-content-around">
				{assign var="open" value=true}
			{/if}
			<div class="col-md-3 col-lg-2">
				{include file="frontend/objects/issue_summary.tpl" heading="h2"}
			</div>
		{/foreach}
		{if $open}
			</div>{* Close an open row *}
		{/if}

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
