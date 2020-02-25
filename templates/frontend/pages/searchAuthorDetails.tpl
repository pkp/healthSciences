{**
 * templates/frontend/pages/searchAuthorDetails.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Index of published articles by author.
 *
 *}
{strip}
	{assign var="pageTitle" value="search.authorDetails"}
	{include file="frontend/components/header.tpl"}
{/strip}

<div class="container page-author-details">
	<div class="row page-header justify-content-md-center">
		<div class="col-md-8">
			<h1>{translate key="search.authorDetails"}</h1>
		</div>
	</div>
	<div class="row justify-content-md-center">
		<div class="col-md-8">
			<div class="page-content" id="authorDetails">
				<h3 class="author-details-author text-lg-center">{$lastName|escape}, {$firstName|escape}{if $middleName} {$middleName|escape}{/if}{if $affiliation}, {$affiliation|escape}{/if}{if $country}, {$country|escape}{/if}</h3>
				<ul class="author-details-articles">
					{foreach from=$submissions item=article}
						{assign var=issueId value=$article->getIssueId()}
						{assign var=issue value=$issues[$issueId]}
						{assign var=issueUnavailable value=$issuesUnavailable.$issueId}
						{assign var=sectionId value=$article->getSectionId()}
						{assign var=journalId value=$article->getJournalId()}
						{assign var=journal value=$journals[$journalId]}
						{assign var=section value=$sections[$sectionId]}
						{if $issue->getPublished() && $section && $journal}
							<li class="author-details-item">
								<div class="author-details-block author-details-issue">
									<a href="{url journal=$journal->getPath() page="issue" op="view" path=$issue->getBestIssueId()}">{$journal->getLocalizedName()|escape} {$issue->getIssueIdentification()|escape}</a>
									<span>{$section->getLocalizedTitle()|escape}</span>
								</div>
								<div class="author-details-block author-details-article">
									<a href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestId()}">{$article->getLocalizedTitle()|strip_unsafe_html}</a>
								</div>
								{if (!$issueUnavailable || $publication->getData('accessStatus') == $smarty.const.ARTICLE_ACCESS_OPEN}}
									<div class="author-details-block author-details-galleys">
										{foreach from=$article->getGalleys() item=galley name=galleyList}
											<a href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestId()|to_array:$galley->getBestGalleyId()}"
											   class="btn btn-primary">{$galley->getGalleyLabel()|escape}</a>
										{/foreach}
									</div>
								{/if}
							</li>
						{/if}
					{/foreach}
				</ul>
			</div>
		</div>
	</div>
</div>

{include file="frontend/components/footer.tpl"}

