{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *}
{if $sidebar}
	<section class="site-footer-sidebar ajlii-plugin-output-region" aria-label="{translate|escape key="plugins.themes.ajlii.plugins.outputRegion"}">
		<div class="container">
			<aside class="ajlii-plugin-blocks" role="complementary">
				{$sidebar}
			</aside>
		</div>
	</section>
{/if}

<footer class="site-footer">
	<div class="site-footer-secondary">
		<div class="container site-footer-secondary-grid">
			<nav class="site-footer-link-column" aria-label="{translate|escape key="plugins.themes.ajlii.footer.openAccess"}">
				<h2>{translate key="plugins.themes.ajlii.footer.openAccess"}</h2>
				<a href="https://creativecommons.org/licenses/by/4.0/" rel="license noopener" target="_blank">CC BY 4.0 International</a>
				<a href="{url page="about" op="submissions"}">{translate key="plugins.themes.ajlii.footer.publishWithUs"}</a>
				<a href="{url page="about" op="submissions"}">{translate key="plugins.themes.ajlii.footer.apcAndWaivers"}</a>
				<a href="{url page="about"}">{translate key="plugins.themes.ajlii.footer.ethicsIntegrity"}</a>
			</nav>
			<nav class="site-footer-link-column" aria-label="{translate|escape key="plugins.themes.ajlii.footer.supportLinks"}">
				<h2>{translate key="plugins.themes.ajlii.footer.supportLinks"}</h2>
				<a href="{url page="about" op="contact"}">{translate key="plugins.themes.ajlii.footer.contact"}</a>
				<a href="{url page="about" op="privacy"}">{translate key="plugins.themes.ajlii.footer.privacyPolicy"}</a>
				<details class="site-footer-legal-note">
					<summary>{translate key="plugins.themes.ajlii.footer.legalNotice"}</summary>
					<p>{translate key="plugins.themes.ajlii.footer.legalNoticeText"}</p>
				</details>
			</nav>
			<div class="site-footer-brand-block">
				<a class="site-footer-publisher-mark" href="{url page="index" router=\PKP\core\PKPApplication::ROUTE_PAGE}" aria-label="{translate|escape key="plugins.themes.ajlii.footer.cuulPublishing"}">
					<span class="site-footer-publisher-logo" aria-hidden="true">
						{if $displayPageHeaderLogo}
							<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}"
							     {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"
							     {else}alt="{translate key="plugins.themes.ajlii.publisher"}"{/if}>
						{else}
							CUUL
						{/if}
					</span>
					<span>{translate key="plugins.themes.ajlii.footer.cuulPublishing"}</span>
				</a>
			</div>
			{if $ajliiAuthorityLinks}
				<nav class="site-footer-link-column ajlii-authority-links" aria-label="{translate|escape key="plugins.themes.ajlii.authority.title"}">
					<h2>{translate key="plugins.themes.ajlii.authority.title"}</h2>
					{foreach from=$ajliiAuthorityLinks item=authorityLink}
						<a href="{$authorityLink.url|escape}" target="_blank" rel="me noopener">{$authorityLink.label|escape}</a>
					{/foreach}
				</nav>
			{/if}
		</div>
		<div class="container site-footer-bottom">
			<p>&copy; {$smarty.now|date_format:"Y"} {translate key="plugins.themes.ajlii.publisher"}. {translate key="plugins.themes.ajlii.footer.copyright"}</p>
			<p>{translate key="plugins.themes.ajlii.footer.hostedOn"} <a href="{url page="about" op="aboutThisPublishingSystem"}">Open Journal Systems</a>.</p>
			{if $pageFooter}
				<div class="site-footer-custom">
					{$pageFooter}
				</div>
			{/if}
		</div>
	</div>
</footer><!-- pkp_structure_footer_wrapper -->

{if $ajliiCitationMonitorUrl}
	<div data-ajlii-citation-monitor data-monitor-url="{$ajliiCitationMonitorUrl|escape}" hidden></div>
{/if}

<div class="ajlii-cookie-consent" data-ajlii-cookie-consent hidden>
	<div class="ajlii-cookie-banner" role="region" aria-labelledby="ajliiCookieBannerTitle">
		<div class="ajlii-cookie-banner-copy">
			<h2 id="ajliiCookieBannerTitle">{translate key="plugins.themes.ajlii.cookie.bannerTitle"}</h2>
			<p>{translate key="plugins.themes.ajlii.cookie.bannerText"} <a href="{url page="about" op="privacy"}">{translate key="plugins.themes.ajlii.cookie.noticeLink"}</a></p>
		</div>
		<div class="ajlii-cookie-banner-actions">
			<button type="button" class="btn" data-cookie-action="reject">{translate key="plugins.themes.ajlii.cookie.rejectAll"}</button>
			<button type="button" class="btn btn-primary" data-cookie-action="accept">{translate key="plugins.themes.ajlii.cookie.acceptAll"}</button>
			<button type="button" class="ajlii-cookie-dismiss" data-cookie-action="close" aria-label="{translate key="common.close"}">x</button>
		</div>
	</div>
	<div class="ajlii-cookie-modal" data-cookie-modal hidden>
		<div class="ajlii-cookie-modal-backdrop" data-cookie-settings-close></div>
		<div class="ajlii-cookie-panel" role="dialog" aria-modal="true" aria-labelledby="ajliiCookieTitle">
			<div class="ajlii-cookie-panel-header">
				<strong>{translate key="plugins.themes.ajlii.footer.cuulPublishing"}</strong>
				<button type="button" class="ajlii-cookie-modal-close" data-cookie-settings-close aria-label="{translate key="common.close"}">x</button>
			</div>
			<div class="ajlii-cookie-panel-body">
				<div class="ajlii-cookie-copy">
					<h2 id="ajliiCookieTitle">{translate key="plugins.themes.ajlii.cookie.title"}</h2>
					<p>{translate key="plugins.themes.ajlii.cookie.summary"}</p>
					<p>{translate key="plugins.themes.ajlii.cookie.lawNote"}</p>
					<a href="{url page="about" op="privacy"}">{translate key="plugins.themes.ajlii.cookie.privacyLink"}</a>
				</div>
				<div class="ajlii-cookie-options" aria-label="{translate|escape key="plugins.themes.ajlii.cookie.options"}">
					<label class="ajlii-cookie-option is-required">
						<input type="checkbox" checked disabled>
						<span>
							<strong>{translate key="plugins.themes.ajlii.cookie.necessaryTitle"}</strong>
							<small>{translate key="plugins.themes.ajlii.cookie.alwaysActive"}</small>
						</span>
					</label>
					<label class="ajlii-cookie-option">
						<input type="checkbox" data-cookie-category="functional">
						<span>
							<strong>{translate key="plugins.themes.ajlii.cookie.functionalTitle"}</strong>
							<small>{translate key="plugins.themes.ajlii.cookie.functionalText"}</small>
						</span>
					</label>
					<label class="ajlii-cookie-option">
						<input type="checkbox" data-cookie-category="performance">
						<span>
							<strong>{translate key="plugins.themes.ajlii.cookie.performanceTitle"}</strong>
							<small>{translate key="plugins.themes.ajlii.cookie.performanceText"}</small>
						</span>
					</label>
					<label class="ajlii-cookie-option">
						<input type="checkbox" data-cookie-category="targeting">
						<span>
							<strong>{translate key="plugins.themes.ajlii.cookie.targetingTitle"}</strong>
							<small>{translate key="plugins.themes.ajlii.cookie.targetingText"}</small>
						</span>
					</label>
				</div>
			</div>
			<div class="ajlii-cookie-actions">
				<button type="button" class="btn btn-primary" data-cookie-action="save">{translate key="plugins.themes.ajlii.cookie.confirmChoices"}</button>
			</div>
		</div>
	</div>
</div>
<button type="button" class="ajlii-cookie-floating-button" data-cookie-settings aria-label="{translate|escape key="plugins.themes.ajlii.cookie.settings"}">
	<span class="ajlii-cookie-floating-icon" aria-hidden="true"><span></span></span>
</button>

<div class="ajlii-wcag-widget" data-wcag-widget>
	<button class="ajlii-wcag-toggle" type="button" aria-expanded="false" aria-controls="ajliiWcagPanel">
		<span aria-hidden="true" class="ajlii-wcag-toggle-icon">Aa</span>
		<span class="visually-hidden">{translate key="plugins.themes.ajlii.wcag.open"}</span>
	</button>
	<div class="ajlii-wcag-panel" id="ajliiWcagPanel" hidden>
		<div class="ajlii-wcag-header">
			<h2>{translate key="plugins.themes.ajlii.wcag.title"}</h2>
			<button type="button" class="ajlii-wcag-close" data-wcag-close aria-label="{translate key="common.close"}">x</button>
		</div>
		<button type="button" class="ajlii-wcag-language" data-wcag-action="language">
			<span class="ajlii-wcag-icon" aria-hidden="true">EN</span>
			<span>{translate key="plugins.themes.ajlii.wcag.language"}</span>
		</button>
		<button type="button" class="ajlii-wcag-profile" data-wcag-action="profiles"><span class="ajlii-wcag-icon" aria-hidden="true">AP</span><span>{translate key="plugins.themes.ajlii.wcag.profiles"}</span></button>
		<h3>{translate key="plugins.themes.ajlii.wcag.contentAdjustments"}</h3>
		<div class="ajlii-wcag-font-control">
			<span><span class="ajlii-wcag-icon" aria-hidden="true">Tt</span>{translate key="plugins.themes.ajlii.wcag.fontSize"}</span>
			<div>
				<button type="button" data-wcag-action="fontDown" aria-label="{translate key="plugins.themes.ajlii.wcag.fontDown"}">-</button>
				<output data-wcag-font-output>100%</output>
				<button type="button" data-wcag-action="fontUp" aria-label="{translate key="plugins.themes.ajlii.wcag.fontUp"}">+</button>
			</div>
		</div>
		<div class="ajlii-wcag-grid">
			<button type="button" data-wcag-toggle="highlightTitles"><span class="ajlii-wcag-icon" aria-hidden="true">H1</span><span>{translate key="plugins.themes.ajlii.wcag.highlightTitles"}</span></button>
			<button type="button" data-wcag-toggle="highlightLinks"><span class="ajlii-wcag-icon" aria-hidden="true">Ln</span><span>{translate key="plugins.themes.ajlii.wcag.highlightLinks"}</span></button>
			<button type="button" data-wcag-toggle="dyslexiaFont"><span class="ajlii-wcag-icon" aria-hidden="true">Df</span><span>{translate key="plugins.themes.ajlii.wcag.dyslexiaFont"}</span></button>
			<button type="button" data-wcag-toggle="letterSpacing"><span class="ajlii-wcag-icon" aria-hidden="true">AV</span><span>{translate key="plugins.themes.ajlii.wcag.letterSpacing"}</span></button>
			<button type="button" data-wcag-toggle="lineHeight"><span class="ajlii-wcag-icon" aria-hidden="true">LH</span><span>{translate key="plugins.themes.ajlii.wcag.lineHeight"}</span></button>
			<button type="button" data-wcag-toggle="fontWeight"><span class="ajlii-wcag-icon" aria-hidden="true">Wt</span><span>{translate key="plugins.themes.ajlii.wcag.fontWeight"}</span></button>
			<button type="button" data-wcag-toggle="textAlign"><span class="ajlii-wcag-icon" aria-hidden="true">Al</span><span>{translate key="plugins.themes.ajlii.wcag.textAlign"}</span></button>
		</div>
		<h3>{translate key="plugins.themes.ajlii.wcag.colorAdjustments"}</h3>
		<div class="ajlii-wcag-grid">
			<button type="button" data-wcag-exclusive="contrastMode" data-wcag-value="darkContrast"><span class="ajlii-wcag-icon" aria-hidden="true">DC</span><span>{translate key="plugins.themes.ajlii.wcag.darkContrast"}</span></button>
			<button type="button" data-wcag-exclusive="contrastMode" data-wcag-value="lightContrast"><span class="ajlii-wcag-icon" aria-hidden="true">LC</span><span>{translate key="plugins.themes.ajlii.wcag.lightContrast"}</span></button>
			<button type="button" data-wcag-exclusive="contrastMode" data-wcag-value="highContrast"><span class="ajlii-wcag-icon" aria-hidden="true">HC</span><span>{translate key="plugins.themes.ajlii.wcag.highContrast"}</span></button>
			<button type="button" data-wcag-exclusive="colorMode" data-wcag-value="highSaturation"><span class="ajlii-wcag-icon" aria-hidden="true">HS</span><span>{translate key="plugins.themes.ajlii.wcag.highSaturation"}</span></button>
			<button type="button" data-wcag-exclusive="colorMode" data-wcag-value="lowSaturation"><span class="ajlii-wcag-icon" aria-hidden="true">LS</span><span>{translate key="plugins.themes.ajlii.wcag.lowSaturation"}</span></button>
			<button type="button" data-wcag-exclusive="colorMode" data-wcag-value="monochrome"><span class="ajlii-wcag-icon" aria-hidden="true">Mn</span><span>{translate key="plugins.themes.ajlii.wcag.monochrome"}</span></button>
		</div>
		<h3>{translate key="plugins.themes.ajlii.wcag.navigationAdjustments"}</h3>
		<div class="ajlii-wcag-grid">
			<button type="button" data-wcag-toggle="muteSounds"><span class="ajlii-wcag-icon" aria-hidden="true">Mt</span><span>{translate key="plugins.themes.ajlii.wcag.muteSounds"}</span></button>
			<button type="button" data-wcag-action="readPage"><span class="ajlii-wcag-icon" aria-hidden="true">Rd</span><span>{translate key="plugins.themes.ajlii.wcag.readPage"}</span></button>
			<button type="button" data-wcag-toggle="readingGuide"><span class="ajlii-wcag-icon" aria-hidden="true">Gd</span><span>{translate key="plugins.themes.ajlii.wcag.readingGuide"}</span></button>
			<button type="button" data-wcag-toggle="pauseAnimations"><span class="ajlii-wcag-icon" aria-hidden="true">Ps</span><span>{translate key="plugins.themes.ajlii.wcag.pauseAnimations"}</span></button>
			<button type="button" data-wcag-toggle="bigCursor"><span class="ajlii-wcag-icon" aria-hidden="true">Pt</span><span>{translate key="plugins.themes.ajlii.wcag.bigCursor"}</span></button>
		</div>
		<button type="button" class="ajlii-wcag-reset" data-wcag-action="reset"><span class="ajlii-wcag-icon" aria-hidden="true">R</span><span>{translate key="plugins.themes.ajlii.wcag.reset"}</span></button>
	</div>
</div>

<div class="ajlii-reader-modal" data-ajlii-reader-modal hidden>
	<div class="ajlii-reader-dialog" role="dialog" aria-modal="true" aria-labelledby="ajliiReaderTitle">
		<div class="ajlii-reader-header">
			<h2 id="ajliiReaderTitle">{translate key="plugins.themes.ajlii.reader.title"}</h2>
			<div>
				<a data-ajlii-reader-open href="#" target="_blank" rel="noopener">{translate key="plugins.themes.ajlii.reader.newTab"}</a>
				<button type="button" data-ajlii-reader-close aria-label="{translate key="common.close"}">x</button>
			</div>
		</div>
		<iframe title="{translate key="plugins.themes.ajlii.reader.title"}" data-ajlii-reader-frame></iframe>
	</div>
</div>

<div class="ajlii-ai-panel" data-ajlii-ai-panel hidden data-ai-provider="{$ajliiAiProvider|escape}" data-ai-model="{$ajliiAiModel|escape}" data-ai-proxy-url="{$ajliiAiProxyUrl|escape}">
	<div class="ajlii-ai-dialog" role="dialog" aria-modal="true" aria-labelledby="ajliiAiTitle">
		<div class="ajlii-ai-header">
			<div>
				<h2 id="ajliiAiTitle">{translate key="plugins.themes.ajlii.ai.title"}</h2>
				<p>{translate key="plugins.themes.ajlii.ai.providerLabel"}: <span data-ai-provider-label>{$ajliiAiProvider|escape}</span>{if $ajliiAiModel} / {$ajliiAiModel|escape}{/if}</p>
			</div>
			<button type="button" data-ajlii-ai-close aria-label="{translate key="common.close"}">x</button>
		</div>
		<div class="ajlii-ai-body">
			<div class="ajlii-ai-actions">
				<button type="button" data-ai-action="summarize">{translate key="plugins.themes.ajlii.ai.summarize"}</button>
				<button type="button" data-ai-action="keyPoints">{translate key="plugins.themes.ajlii.ai.keyPoints"}</button>
				<button type="button" data-ai-action="methods">{translate key="plugins.themes.ajlii.ai.methods"}</button>
				<button type="button" data-ai-action="references">{translate key="plugins.themes.ajlii.ai.references"}</button>
			</div>
			<label for="ajliiAiQuestion">{translate key="plugins.themes.ajlii.ai.askLabel"}</label>
			<textarea id="ajliiAiQuestion" data-ai-question rows="4" placeholder="{translate key="plugins.themes.ajlii.ai.askPlaceholder"}"></textarea>
			<button type="button" class="btn btn-primary" data-ai-action="ask">{translate key="plugins.themes.ajlii.ai.askButton"}</button>
			<div class="ajlii-ai-status" data-ai-status role="status"></div>
			<div class="ajlii-ai-answer" data-ai-answer tabindex="0"></div>
			<p class="ajlii-ai-note">{translate key="plugins.themes.ajlii.ai.securityNote"}</p>
		</div>
	</div>
</div>

<div class="ajlii-discovery-panel" data-ajlii-discovery-panel hidden>
	<div class="ajlii-discovery-dialog" role="dialog" aria-modal="true" aria-labelledby="ajliiDiscoveryTitle">
		<div class="ajlii-ai-header">
			<div>
				<h2 id="ajliiDiscoveryTitle">{translate key="plugins.themes.ajlii.discovery.title"}</h2>
				<p>{translate key="plugins.themes.ajlii.discovery.subtitle"}</p>
			</div>
			<button type="button" data-ajlii-discovery-close aria-label="{translate key="common.close"}">x</button>
		</div>
		<div class="ajlii-discovery-body">
			<section class="ajlii-discovery-map" aria-labelledby="ajliiDiscoveryMapTitle">
				<h3 id="ajliiDiscoveryMapTitle">{translate key="plugins.themes.ajlii.discovery.map"}</h3>
				<div data-discovery-map></div>
			</section>
			<section class="ajlii-discovery-signals" aria-labelledby="ajliiDiscoverySignalsTitle">
				<h3 id="ajliiDiscoverySignalsTitle">{translate key="plugins.themes.ajlii.discovery.signals"}</h3>
				<div data-discovery-signals></div>
				<p>{translate key="plugins.themes.ajlii.discovery.note"}</p>
			</section>
		</div>
	</div>
</div>

{* Load author biography modals if they exist *}
{if !empty($smarty.capture.authorBiographyModals|default:""|trim)}
	{$smarty.capture.authorBiographyModals}
{/if}

{* Login modal *}
<div id="loginModal" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				{include file="frontend/components/loginForm.tpl" formType = "loginModal"}
			</div>
		</div>
	</div>
</div>

{load_script context="frontend" scripts=$scripts}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
