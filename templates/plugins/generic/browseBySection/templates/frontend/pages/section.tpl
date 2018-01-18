{**
 * templates/plugins/generic/browseBySection/templates/frontend/pages/section.tpl
 *
 * Copyright (c) 2017 Simon Fraser University
 * Copyright (c) 2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the reader-facing section page.
 *
 * @uses $section Section
 * @uses $sectionPath string The URL path for this section
 * @uses $sectionDescription string
 * @uses $articles array List of Submission objects
 * @uses $issues array List of Issue objects the $articles are published in
 * @uses $currentlyShowingStart int 20 in `20-30 of 100 results`
 * @uses $currentlyShowingEnd int 30 in `20-30 of 100 results`
 * @uses $countMax int 100 in `20-30 of 100 results`
 * @uses $currentlyShowingPage int 2 in `2 of 10 pages`
 * @uses $countMaxPage int 10 in `2 of 10 pages`.
 *}

{include file="frontend/components/header.tpl" pageTitleTranslated=$section->getLocalizedTitle()}

<div class="container page-section">
	<div class="page-header">
		<h1>{$section->getLocalizedTitle()|escape}</h1>
	</div>
	<div class="row justify-content-md-center">
		{if $sectionDescription}
			<div class="col-lg-4">
				<div class="section-description">{$sectionDescription}</div>
			</div>
		{/if}
		<div class="col-lg-8">
			<div class="page-content">
				{if !$articles|@count}
					<div class="alert alert-danger">
						{translate key="plugins.generic.browseBySection.emptySection"}
					</div>
				{else}
					<div class="section-articles">
						{foreach from=$articles item=article}
							{include file="frontend/objects/article_summary.tpl" section=null showDatePublished=true hideGalleys=true}
						{/foreach}
					</div>
					{if $prevPage > 1}
						{url|assign:"prevUrl" router=$smarty.const.ROUTE_PAGE page="section" op="view" path=$sectionPath|to_array:$prevPage}
					{elseif $prevPage === 1}
						{url|assign:"prevUrl" router=$smarty.const.ROUTE_PAGE page="section" op="view" path=$sectionPath}
					{/if}
					{if $nextPage}
						{url|assign:"nextUrl" router=$smarty.const.ROUTE_PAGE page="section" op="view" path=$sectionPath|to_array:$nextPage}
					{/if}
					{include
						file="frontend/components/pagination.tpl"
						prevUrl=$prevUrl
						nextUrl=$nextUrl
						showingStart=$showingStart
						showingEnd=$showingEnd
						total=$total
					}
				{/if}
			</div>
		</div>
	</div>
</div>

{include file="frontend/components/footer.tpl"}
