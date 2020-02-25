{**
 * templates/frontend/pages/issueGalley.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Lightweight page for viewing PDF files
 *
 * @uses $pdfTitle string Title of the pdf being viewed
 *       attached to
 * @uses $galley Galley The PDF galley to display
 * @uses $parent Issue|Article Object which this galley is attached to
 *}

{* Get the Id of the parent object *}
{capture assign="parentUrl"}
{if $parent instanceOf Issue}
	{assign var="parentId" value=$parent->getBestIssueId()}
	{url op="view" path=$parentId}
{else}
	{assign var="parentId" value=$parent->getBestId()}
	{url page="article" op="view" path=$parentId}
{/if}
{/capture}

<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>{translate key="article.pdf.pageTitle" pdfTitle=$pdfTitle}</title>

	{load_header context="frontend" headers=$headers}
	{load_stylesheet context="frontend" stylesheets=$stylesheets}
</head>
<body>

	{* Header wrapper *}
	<header>

		<a href="{$parentUrl}">
			<span>
				{if $parent instanceOf Issue}
					{translate key="issue.return"}
				{else}
					{translate key="article.return"}
				{/if}
			</span>
		</a>

		<a href="{$parentUrl}">
			{$pdfTitle}
		</a>

		<a href="{url page="issue" op="download" path=$parentId|to_array:$galley->getBestGalleyId()}" download>
			<span>
				{translate key="common.download"}
			</span>
			<span>
				{translate key="common.downloadPdf"}
			</span>
		</a>

	</header>

	<iframe></iframe>

	{call_hook name="Templates::Common::Footer::PageFooter"}

</body>
</html>
