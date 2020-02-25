{**
 * templates/frontend/pages/search.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to search and view search results.
 *
 * @uses $query Value of the primary search query
 * @uses $authors Value of the authors search filter
 * @uses $dateFrom Value of the date from search filter (published after).
 *  Value is a single string: YYYY-MM-DD HH:MM:SS
 * @uses $dateTo Value of the date to search filter (published before).
 *  Value is a single string: YYYY-MM-DD HH:MM:SS
 * @uses $yearStart Earliest year that can be used in from/to filters
 * @uses $yearEnd Latest year that can be used in from/to filters
 *}
{include file="frontend/components/header.tpl" pageTitle="common.search"}

<div class="container page-search">
	<div class="page-header">
		<h1>
			{if $query}
				{translate key="plugins.themes.healthSciences.search.resultsFor" query=$query|escape}
			{elseif $authors}
				{translate key="plugins.themes.healthSciences.search.resultsFor" query=$authors|escape}
			{else}
				{translate key="common.search"}
			{/if}
		</h1>
	</div>
	<div class="row justify-content-lg-center">
		<div class="col-lg-8 search-col-results">
			<div class="search-results">

				{* No results found *}
				{if $results->wasEmpty()}
					{if $error}
						<div class="alert alert-danger" role="alert">{$error|escape}</div>
					{else}
						<div class="alert alert-primary" role="alert">{translate key="search.noResults"}</div>
					{/if}

				{* Results pagination *}
				{else}
					{iterate from=results item=result}
						{include file="frontend/objects/article_summary.tpl" article=$result.publishedSubmission journal=$result.journal showDatePublished=true hideGalleys=true}
					{/iterate}
					<div class="pagination">
						{page_info iterator=$results}
						{page_links anchor="results" iterator=$results name="search" query=$query searchJournal=$searchJournal authors=$authors title=$title abstract=$abstract galleyFullText=$galleyFullText discipline=$discipline subject=$subject type=$type coverage=$coverage indexTerms=$indexTerms dateFromMonth=$dateFromMonth dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateToMonth=$dateToMonth dateToDay=$dateToDay dateToYear=$dateToYear orderBy=$orderBy orderDir=$orderDir}
					</div>
				{/if}
			</div>
		</div>
		<div class="col-lg-4 search-col-filters">
			<div class="search-filters">
				<h2>{translate key="plugins.themes.healthSciences.search.params"}</h2>

				{capture name="searchFormUrl"}{url op="search" escape=false}{/capture}
				{$smarty.capture.searchFormUrl|parse_url:$smarty.const.PHP_URL_QUERY|parse_str:$formUrlParameters}
				<form class="form-search" method="get" action="{$smarty.capture.searchFormUrl|strtok:"?"|escape}">
					{foreach from=$formUrlParameters key=paramKey item=paramValue}
						<input type="hidden" name="{$paramKey|escape}" value="{$paramValue|escape}"/>
					{/foreach}

					<div class="form-group form-group-query">
						<label for="query">
							{translate key="common.searchQuery"}
						</label>
						<input type="text" class="form-control" id="query" name="query" value="{$query|escape}">
					</div>
					<div class="form-group form-group-authors">
						<label for="authors">
							{translate key="search.author"}
						</label>
						<input type="text" class="form-control" id="authors" name="authors" value="{$authors|escape}">
					</div>
					<div class="form-group form-group-date-from">
						<label for="dateFromYear">
							{translate key="search.dateFrom"}
						</label>
						<div class="form-control-date">
							{html_select_date class="form-control" prefix="dateFrom" time=$dateFrom start_year=$yearStart end_year=$yearEnd year_empty="" month_empty="" day_empty="" field_order="YMD"}
						</div>
					</div>
					<div class="form-group form-group-date-to">
						<label for="dateToYear">
							{translate key="search.dateTo"}
						</label>
						<div class="form-control-date">
							{html_select_date class="form-control" prefix="dateTo" time=$dateTo start_year=$yearStart end_year=$yearEnd year_empty="" month_empty="" day_empty="" field_order="YMD"}
						</div>
					</div>
					<div class="form-group form-group-buttons">
						<button class="btn btn-primary" type="submit">{translate key="common.search"}</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

{include file="frontend/components/footer.tpl"}
