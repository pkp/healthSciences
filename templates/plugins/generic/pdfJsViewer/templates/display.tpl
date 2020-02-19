{**
 * plugins/generic/pdfJsViewer/templates/display.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Template to view a PDF or HTML galley
 *}
<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{capture assign="pageTitleTranslated"}{translate key="article.pageTitle" title=$title}{/capture}
{include file="frontend/components/headerHead.tpl" pageTitleTranslated=$pageTitleTranslated}
<body class="page-view-pdf">
	<div class="pdf-header">
		<div class="pdf-return-article">
			<a href="{$parentUrl}" class="btn btn-text">
				←
				<span class="sr-only">
					{if $parent instanceOf Issue}
						{translate key="issue.return"}
					{else}
						{translate key="article.return"}
					{/if}
				</span>
				{if $isLatestPublication}
					{$title|escape}
				{/if}
			</a>
		</div>
		{if !$isLatestPublication}
		<div class="alert alert-primary" role="alert">
			{translate key="submission.outdatedVersion"
				datePublished=$galleyPublication->getData('datePublished')|date_format:$dateFormatLong
				urlRecentVersion=$parentUrl
			}
		</div>
		{/if}
		<div class="pdf-download-button">
			<a href="{$pdfUrl}" class="btn" download>
				<span class="label">
					{translate key="common.download"}
				</span>
			</a>
		</div>
	</div>

	<div id="pdfCanvasContainer" class="pdf-frame">
		<iframe src="{$pluginUrl}/pdf.js/web/viewer.html?file={$pdfUrl|escape:"url"}" width="100%" height="100%" style="min-height: 500px;" allowfullscreen webkitallowfullscreen></iframe>
	</div>
	{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
