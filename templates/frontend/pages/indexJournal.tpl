{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the
 *       homepage
 * @uses $issue Issue Current issue
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

{if $homepageImage}
	<div class="homepage-image{if $issue} homepage-image-behind-issue{/if}">
		<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}">
	</div>
{/if}

<div class="container container-homepage-issue page-content">
	{if $issue}
		<h2 class="h5 homepage-issue-current">
			{translate key="journal.currentIssue"}
		</h2>
		<div class="h1 homepage-issue-identifier">
			{$issue->getIssueSeries()|escape}
		</div>
		<div class="h6 homepage-issue-published">
			{translate key="plugins.themes.healthSciences.currentIssuePublished" date=$issue->getDatePublished()|date_format:$dateFormatLong}
		</div>

		{* make the entire block conditional if there aren't any additional issue data *}
		{if  $issue->getLocalizedCoverImageUrl() || $issue->hasDescription() || $issueGalleys}
			<div class="row justify-content-center homepage-issue-header">
				{if $issue->getLocalizedCoverImageUrl()}
					<div class="col-lg-3">
						<a href="{url op="view" page="issue" path=$issue->getBestIssueId()}">
							<img class="img-fluid homepage-issue-cover" src="{$issue->getLocalizedCoverImageUrl()|escape}"{if $issue->getLocalizedCoverImageAltText() != ''} alt="{$issue->getLocalizedCoverImageAltText()|escape}"{/if}>
						</a>
					</div>
				{/if}
				{if $issue->hasDescription() || $journalDescription || $issueGalleys}
					<div class="col-lg-9">
						<div class="homepage-issue-description-wrapper">
							{if $issue->hasDescription()}
								<div class="homepage-issue-description">
									<div class="h2">
										{if $issue->getLocalizedTitle()}
											{$issue->getLocalizedTitle()|escape}
										{else}
											{translate key="plugins.themes.healthSciences.issueDescription"}
										{/if}
									</div>
									{$issue->getLocalizedDescription()|strip_unsafe_html}
									<div class="homepage-issue-description-more">
										<a href="{url op="view" page="issue" path=$issue->getBestIssueId()}">{translate key="common.more"}</a>
									</div>
								</div>
							{elseif $journalDescription}
								<div class="homepage-journal-description long-text" id="homepageDescription">
									{$journalDescription|strip_unsafe_html}
								</div>
								<div class="homepage-description-buttons hidden" id="homepageDescriptionButtons">
									<a class="homepage-journal-description-more hidden" id="homepageDescriptionMore">{translate key="common.more"}</a>
									<a class="homepage-journal-description-less hidden" id="homepageDescriptionLess">{translate key="common.less"}</a>
								</div>
							{/if}
							{if $issueGalleys}
								<div class="homepage-issue-galleys">
									<div class="h3">
										{translate key="issue.fullIssue"}
									</div>
									{foreach from=$issueGalleys item=galley}
										{include file="frontend/objects/galley_link.tpl" parent=$issue purchaseFee=$currentJournal->getSetting('purchaseIssueFee') purchaseCurrency=$currentJournal->getSetting('currency')}
									{/foreach}
								</div>
							{/if}
						</div>
					</div>
				{/if}
			</div>
		{/if}

	{/if}

	{* display announcements before full issue *}
	{if $numAnnouncementsHomepage && $announcements|@count}
	<section class="row homepage-announcements">
		<h2 class="sr-only">{translate key="announcement.announcementsHome"}</h2>
		{foreach from=$announcements item=announcement}
			<article class="col-md-4 homepage-announcement">
				<h3 class="homepage-announcement-title">{$announcement->getLocalizedTitle()|escape}</h3>
				<p>{$announcement->getLocalizedDescriptionShort()|strip_unsafe_html}
					<br>
					<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}">
						{capture name="more" assign="more"}{translate key="common.more"}{/capture}
						{translate key="plugins.themes.healthSciences.more" text=$more}
					</a>
				</p>
				<footer>
					<small class="homepage-announcement-date">{$announcement->getDatePosted()|date_format:$dateFormatLong}</small>
				</footer>
			</article>
		{/foreach}
	</section>
	{/if}

	{if $issue}
		<div class="row issue-wrapper{if $homepageImage && $issue->hasDescription()} issue-full-data{elseif $homepageImage && $issue->getLocalizedCoverImageUrl()} issue-image-cover{elseif $homepageImage} issue-only-image{/if}">
			<div class="col-12 col-lg-9">
				{include file="frontend/objects/issue_toc.tpl" sectionHeading="h3"}
			</div>
		</div>

		<div class="text-center">
			<a class="btn" href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}">
				{translate key="journal.viewAllIssues"}
			</a>
		</div>
	{/if}

	{* Additional Homepage Content *}
	{if $additionalHomeContent}
		<div class="row justify-content-center homepage-additional-content">
			<div class="col-lg-9">{$additionalHomeContent}</div>
		</div>
	{/if}
</div><!-- .container -->

{include file="frontend/components/footer.tpl"}
