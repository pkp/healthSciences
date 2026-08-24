{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
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

{if $ajliiHomepageSliderEnabled}
	<section class="ajlii-home-slider" data-ajlii-home-slider data-autoplay="{if $ajliiHomepageSliderAutoplay}true{else}false{/if}" aria-labelledby="ajliiHomeSliderTitle">
		<div class="container ajlii-home-slider-inner">
			<h2 id="ajliiHomeSliderTitle" class="visually-hidden">{translate key="plugins.themes.ajlii.slider.title"}</h2>
			<div class="ajlii-home-slider-track" data-slider-track>
				{foreach from=$ajliiHomepageSliderSlides item=slide name=managedSlides}
					<article class="ajlii-home-slide{if !$slide.imageUrl} ajlii-home-slide-no-image{/if}{if $smarty.foreach.managedSlides.first} is-active{/if}" data-slider-slide>
						{if $slide.imageUrl}
							<img src="{$slide.imageUrl|escape}" alt="{$slide.title|escape}">
						{/if}
						<div class="ajlii-home-slide-content">
							<p class="ajlii-home-slide-kicker">{$slide.type|escape}</p>
							{if $slide.title}<h3>{$slide.title|escape}</h3>{/if}
							{if $slide.description}<p>{$slide.description|escape}</p>{/if}
							{if $slide.url}<a class="btn btn-primary" href="{$slide.url|escape}">{$slide.label|escape}</a>{/if}
						</div>
					</article>
				{/foreach}
				{if $homepageImage}
					<article class="ajlii-home-slide{if empty($ajliiHomepageSliderSlides)} is-active{/if}" data-slider-slide>
						<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}">
						<div class="ajlii-home-slide-content">
							<p class="ajlii-home-slide-kicker">{translate key="plugins.themes.ajlii.slider.featured"}</p>
							<h3>{translate key="plugins.themes.ajlii.journalTitle"}</h3>
							<p>{translate key="plugins.themes.ajlii.slider.tagline"}</p>
							<a class="btn btn-primary" href="{url page="about"}">{translate key="plugins.themes.ajlii.slider.about"}</a>
						</div>
					</article>
				{/if}
				{if $issue}
					<article class="ajlii-home-slide{if empty($ajliiHomepageSliderSlides) && !$homepageImage} is-active{/if}" data-slider-slide>
						{if $issue->getLocalizedCoverImageUrl()}
							<img src="{$issue->getLocalizedCoverImageUrl()|escape}"{if $issue->getLocalizedCoverImageAltText() != ''} alt="{$issue->getLocalizedCoverImageAltText()|escape}"{else} alt="{$issue->getIssueSeries()|escape}"{/if}>
						{/if}
						<div class="ajlii-home-slide-content">
							<p class="ajlii-home-slide-kicker">{translate key="journal.currentIssue"}</p>
							<h3>{$issue->getIssueSeries()|escape}</h3>
							{if $issue->getLocalizedTitle()}<p>{$issue->getLocalizedTitle()|escape}</p>{/if}
							<a class="btn btn-primary" href="{url op="view" page="issue" path=$issue->getBestIssueId()}">{translate key="plugins.themes.ajlii.slider.viewIssue"}</a>
						</div>
					</article>
				{/if}
				{if $numAnnouncementsHomepage && $announcements|@count}
					{foreach from=$announcements item=announcement name=sliderAnnouncements}
						{if $smarty.foreach.sliderAnnouncements.iteration <= 3}
							<article class="ajlii-home-slide ajlii-home-slide-no-image{if empty($ajliiHomepageSliderSlides) && !$homepageImage && !$issue && $smarty.foreach.sliderAnnouncements.first} is-active{/if}" data-slider-slide>
								<div class="ajlii-home-slide-content">
									<p class="ajlii-home-slide-kicker">{translate key="announcement.announcements"}</p>
									<h3>{$announcement->getLocalizedData('title')|escape}</h3>
									<p>{$announcement->getLocalizedData('descriptionShort')|strip_tags|escape}</p>
									<a class="btn btn-primary" href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="announcement" op="view" path=$announcement->id}">{translate key="plugins.themes.ajlii.slider.readMore"}</a>
								</div>
							</article>
						{/if}
					{/foreach}
				{/if}
				{if empty($ajliiHomepageSliderSlides) && !$homepageImage && !$issue && !($numAnnouncementsHomepage && $announcements|@count)}
					<article class="ajlii-home-slide ajlii-home-slide-no-image is-active" data-slider-slide>
						<div class="ajlii-home-slide-content">
							<p class="ajlii-home-slide-kicker">{translate key="plugins.themes.ajlii.slider.featured"}</p>
							<h3>{translate key="plugins.themes.ajlii.journalTitle"}</h3>
							<p>{translate key="plugins.themes.ajlii.slider.tagline"}</p>
							<a class="btn btn-primary" href="{url page="about"}">{translate key="plugins.themes.ajlii.slider.about"}</a>
						</div>
					</article>
				{/if}
			</div>
			<div class="ajlii-home-slider-controls">
				<button type="button" data-slider-prev aria-label="{translate key="plugins.themes.ajlii.slider.previous"}">&lsaquo;</button>
				<div class="ajlii-home-slider-dots" data-slider-dots></div>
				<button type="button" data-slider-next aria-label="{translate key="plugins.themes.ajlii.slider.next"}">&rsaquo;</button>
			</div>
		</div>
	</section>
{elseif $homepageImage}
	<div class="homepage-image{if $issue} homepage-image-behind-issue{/if}">
		<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}">
	</div>
{/if}

<div class="container container-homepage-issue page-content">
	<div class="ajlii-home-content-grid">
		<div class="ajlii-home-content-main">
	{if $issue}
		<section class="ajlii-current-issue-showcase" aria-labelledby="ajliiCurrentIssueTitle">
			<div class="ajlii-current-issue-cover-card">
				<a href="{url op="view" page="issue" path=$issue->getBestIssueId()}">
					{if $issue->getLocalizedCoverImageUrl()}
						<img class="homepage-issue-cover" src="{$issue->getLocalizedCoverImageUrl()|escape}"{if $issue->getLocalizedCoverImageAltText() != ''} alt="{$issue->getLocalizedCoverImageAltText()|escape}"{else} alt="{$issue->getIssueSeries()|escape}"{/if}>
					{else}
						<span class="homepage-issue-cover-placeholder" aria-hidden="true">
							<strong>AJLII</strong>
							<small>{translate key="journal.currentIssue"}</small>
						</span>
					{/if}
				</a>
				<h2 class="homepage-issue-current">{translate key="journal.currentIssue"}</h2>
				<p class="homepage-issue-identifier">{$issue->getIssueSeries()|escape}</p>
				<p class="homepage-issue-published">{translate key="plugins.themes.ajlii.currentIssuePublished" date=$issue->getDatePublished()|date_format:$dateFormatLong}</p>
			</div>
			<div class="ajlii-current-issue-summary">
				<p class="ajlii-home-slide-kicker">{translate key="plugins.themes.ajlii.currentIssueLabel"}</p>
				<h2 id="ajliiCurrentIssueTitle">
					{if $issue->getLocalizedTitle()}
						{$issue->getLocalizedTitle()|escape}
					{else}
						{$issue->getIssueSeries()|escape}
					{/if}
				</h2>
				{if $issue->hasDescription()}
					<div class="homepage-issue-description">
						{$issue->getLocalizedDescription()|strip_unsafe_html}
					</div>
				{elseif $journalDescription}
					<div class="homepage-journal-description long-text" id="homepageDescription">
						{$journalDescription|strip_unsafe_html}
					</div>
				{else}
					<p>{translate key="plugins.themes.ajlii.currentIssueFallback"}</p>
				{/if}
				<div class="ajlii-current-issue-actions">
					<a class="btn btn-primary" href="{url op="view" page="issue" path=$issue->getBestIssueId()}">{translate key="plugins.themes.ajlii.slider.viewIssue"}</a>
					{if $issueGalleys}
						<div class="homepage-issue-galleys" aria-label="{translate|escape key="issue.fullIssue"}">
							{foreach from=$issueGalleys item=galley}
								{include file="frontend/objects/galley_link.tpl" parent=$issue purchaseFee=$currentJournal->getSetting('purchaseIssueFee') purchaseCurrency=$currentJournal->getSetting('currency')}
							{/foreach}
						</div>
					{/if}
				</div>
			</div>
		</section>

	{/if}
	{* display announcements before full issue *}
	{if $numAnnouncementsHomepage && $announcements|@count}
	<section class="row homepage-announcements">
		<h2 class="visually-hidden">{translate key="announcement.announcementsHome"}</h2>
		{foreach from=$announcements item=announcement}
			<article class="col-md-4 homepage-announcement">
				<h3 class="homepage-announcement-title">{$announcement->getLocalizedData('title')|escape}</h3>
				<p>{$announcement->getLocalizedData('descriptionShort')|strip_unsafe_html}
					<br>
					<a href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="announcement" op="view" path=$announcement->id}">
						{capture name="more" assign="more"}{translate key="common.more"}{/capture}
						{translate key="plugins.themes.ajlii.more" text=$more}
					</a>
				</p>
				<footer>
					<small class="homepage-announcement-date">{$announcement->datePosted|date_format:$dateFormatLong}</small>
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
			<a class="btn" href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="issue" op="archive"}">
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
		</div>
		<aside class="ajlii-home-utility-panel" aria-label="{translate|escape key="plugins.themes.ajlii.homeTools.title"}">
			<section>
				<h2>{translate key="plugins.themes.ajlii.homeTools.latestPublications"}</h2>
				<div class="ajlii-feed-links">
					<a href="{url page="gateway" op="plugin" path="WebFeedGatewayPlugin"}/atom" rel="alternate" type="application/atom+xml"><span aria-hidden="true">Atom</span>{translate key="plugins.themes.ajlii.homeTools.atom"}</a>
					<a href="{url page="gateway" op="plugin" path="WebFeedGatewayPlugin"}/rss2" rel="alternate" type="application/rss+xml"><span aria-hidden="true">RSS2</span>{translate key="plugins.themes.ajlii.homeTools.rss2"}</a>
					<a href="{url page="gateway" op="plugin" path="WebFeedGatewayPlugin"}/rss" rel="alternate" type="application/rss+xml"><span aria-hidden="true">RSS1</span>{translate key="plugins.themes.ajlii.homeTools.rss1"}</a>
				</div>
			</section>
			<section>
				<h2>{translate key="plugins.themes.ajlii.homeTools.information"}</h2>
				<a href="{url page="information" op="readers"}">{translate key="plugins.themes.ajlii.footer.forReaders"}</a>
				<a href="{url page="information" op="authors"}">{translate key="plugins.themes.ajlii.footer.forAuthors"}</a>
				<a href="{url page="information" op="librarians"}">{translate key="plugins.themes.ajlii.footer.forLibrarians"}</a>
			</section>
			<section>
				<h2>{translate key="plugins.themes.ajlii.homeTools.makeSubmission"}</h2>
				<a class="ajlii-home-submit-link" href="{url page="about" op="submissions"}">{translate key="plugins.themes.ajlii.homeTools.makeSubmission"}</a>
			</section>
			<section>
				<h2>{translate key="plugins.themes.ajlii.footer.journalLinks"}</h2>
				<a href="{url page="about"}">{translate key="plugins.themes.ajlii.footer.aboutJournal"}</a>
				<a href="{url page="about" op="editorialMasthead"}">{translate key="plugins.themes.ajlii.footer.editorialBoard"}</a>
				<a href="{url page="about" op="submissions"}">{translate key="plugins.themes.ajlii.footer.authorGuidelines"}</a>
				<a href="{url page="issue" op="archive"}">{translate key="journal.archives"}</a>
				<a href="{url page="announcements"}">{translate key="announcement.announcements"}</a>
			</section>
			<section>
				<h2>{translate key="plugins.themes.ajlii.footer.publisherLinks"}</h2>
				<a href="{url page="about" op="contact"}">{translate key="plugins.themes.ajlii.footer.contactPage"}</a>
				<a href="{url page="search"}">{translate key="common.search"}</a>
				<a href="{url page="information" op="authors"}">{translate key="plugins.themes.ajlii.footer.forAuthors"}</a>
				<a href="{url page="information" op="readers"}">{translate key="plugins.themes.ajlii.footer.forReaders"}</a>
				<a href="{url page="information" op="librarians"}">{translate key="plugins.themes.ajlii.footer.forLibrarians"}</a>
			</section>
		</aside>
	</div>
</div><!-- .container -->

{include file="frontend/components/footer.tpl"}
