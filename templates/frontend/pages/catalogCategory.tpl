{**
 * templates/frontend/pages/catalogCategory.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view a category of the catalog.
 *
 * @uses $category Category Current category being viewed
 * @uses $publishedSubmissions array List of published submissions in this category
 * @uses $parentCategory Category Parent category if one exists
 * @uses $subcategories array List of subcategories if they exist
 * @uses $prevPage int The previous page number
 * @uses $nextPage int The next page number
 * @uses $showingStart int The number of the first item on this page
 * @uses $showingEnd int The number of the last item on this page
 * @uses $total int Count of all published submissions in this category
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$category->getLocalizedTitle()|escape}

<div class="container page-catalog-category">

	<div class="page-header page-category-header">
		<h1>{$category->getLocalizedTitle()|escape}</h1>
		<div class="page-category-count">
			{translate key="catalog.browseTitles" numTitles=$total}
		</div>
	</div>

	{* Image and description *}
	{assign var="image" value=$category->getImage()}
	{assign var="description" value=$category->getLocalizedDescription()|strip_unsafe_html}
	{if $description || $image}
		<div class="row justify-content-center page-category-details">
			{if $description}
				<div class="col-lg-9">
					<div class="page-category-description-wrapper">
						{$description}
					</div>
				</div>
			{/if}
			{if $image}
				<div class="col-lg-3">
					<a href="{url router=$smarty.const.ROUTE_PAGE page="catalog" op="fullSize" type="category" id=$category->getId()}">
						<img class="img-fluid page-category-cover" src="{url router=$smarty.const.ROUTE_PAGE page="catalog" op="fullSize" type="category" id=$category->getId()}" alt="{$category->getLocalizedTitle()|escape}" />
					</a>
				</div>
			{/if}
		</div>
	{/if}

	<div class="row{if !$description || !$image} justify-content-center{/if}">
		<div class="col-12 col-lg-9">
			{if $subcategories|@count}
				<nav class="category-subcategories" role="navigation">
					<h2 class="category-title">
						{translate key="catalog.category.subcategories"}
					</h2>
					<ul class="category-subcategories-list">
						{foreach from=$subcategories item=subcategory}
							<li>
								<a href="{url op="category" path=$subcategory->getPath()}">
									{$subcategory->getLocalizedTitle()|escape}
								</a>
							</li>
						{/foreach}
					</ul>
				</nav>
			{/if}

			<h2 class="category-title">
				{translate key="catalog.category.heading"}
			</h2>

			{* No published titles in this category *}
			{if empty($publishedSubmissions)}
				<p>{translate key="catalog.category.noItems"}</p>
			{else}
				<div class="category-toc">
					{foreach from=$publishedSubmissions item=article}
						{include file="frontend/objects/article_summary.tpl"}
					{/foreach}
				</div>

				{* Pagination *}
				{if $prevPage > 1}
					{capture assign=prevUrl}{url router=$smarty.const.ROUTE_PAGE page="catalog" op="category" path=$category->getPath()|to_array:$prevPage}{/capture}
				{elseif $prevPage === 1}
					{capture assign=prevUrl}{url router=$smarty.const.ROUTE_PAGE page="catalog" op="category" path=$category->getPath()}{/capture}
				{/if}
				{if $nextPage}
					{capture assign=nextUrl}{url router=$smarty.const.ROUTE_PAGE page="catalog" op="category" path=$category->getPath()|to_array:$nextPage}{/capture}
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

</div><!-- .container -->

{include file="frontend/components/footer.tpl"}
