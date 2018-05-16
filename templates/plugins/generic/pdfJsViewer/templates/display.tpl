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
				{$title}
			</a>
		</div>
		<div class="pdf-download-button">
			<a href="{$pdfUrl}" class="btn" download>
				<span class="label">
					{translate key="common.download"}
				</span>
			</a>
		</div>
	</div>

	<script type="text/javascript" src="{$pluginUrl}/pdf.js/build/pdf.js"></script>
	<script type="text/javascript">
		{literal}
			$(document).ready(function() {
				PDFJS.workerSrc='{/literal}{$pluginUrl}/pdf.js/build/pdf.worker.js{literal}';
				PDFJS.getDocument({/literal}'{$pdfUrl|escape:"javascript"}'{literal}).then(function(pdf) {
					// Using promise to fetch the page
					pdf.getPage(1).then(function(page) {
						var pdfCanvasContainer = $('#pdfCanvasContainer');
						var canvas = document.getElementById('pdfCanvas');
						canvas.height = pdfCanvasContainer.height();
						canvas.width = pdfCanvasContainer.width()-2; // 1px border each side
						var viewport = page.getViewport(canvas.width / page.getViewport(1.0).width);
						var context = canvas.getContext('2d');
						var renderContext = {
							canvasContext: context,
							viewport: viewport
						};
						page.render(renderContext);
					});
				});
			});
		{/literal}
	</script>
	<script type="text/javascript" src="{$pluginUrl}/pdf.js/web/viewer.js"></script>

	<div id="pdfCanvasContainer" class="pdf-frame">
		<iframe src="{$pluginUrl}/pdf.js/web/viewer.html?file={$pdfUrl|escape:"url"}" width="100%" height="100%" style="min-height: 500px;" allowfullscreen webkitallowfullscreen></iframe>
	</div>
	{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
