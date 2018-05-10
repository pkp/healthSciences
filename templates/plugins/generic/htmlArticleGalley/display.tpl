{**
 * plugins/generic/htmlArticleGalley/display.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Embedded viewing of a HTML galley.
 * @uses $boolEmbeddedCss bool is true if HTML galley has attached CSS file
 *}
<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{translate|assign:"pageTitleTranslated" key="article.pageTitle" title=$article->getLocalizedTitle()}
{include file="frontend/components/headerHead.tpl"}
<body class="pkp_page_{$requestedPage|escape} pkp_op_{$requestedOp|escape}">

{* Header wrapper *}
<header class="header_view">

	<a href="{url page="article" op="view" path=$article->getBestArticleId()}" class="return">
		<span class="pkp_screen_reader">
			{translate key="article.return"}
		</span>
	</a>

	<a href="{url page="article" op="view" path=$article->getBestArticleId()}" class="title">
		{$article->getLocalizedTitle()|escape}
	</a>
</header>

<div id="htmlContainer" class="galley_view">
	<iframe id="htmlGalleyFrame" name="htmlFrame" src="{url page="article" op="download" path=$article->getBestArticleId()|to_array:$galley->getBestGalleyId() inline=true}" allowfullscreen webkitallowfullscreen></iframe>
</div>
{call_hook name="Templates::Common::Footer::PageFooter"}

{* Default style if CSS isn't attached to the HTML Galley *}
{if $boolEmbeddedCss === false}
	<script type="text/javascript">{literal}
        window.onload = function() {
            var iframe = document.getElementById('htmlGalleyFrame');
            var insideFrame = iframe.contentDocument || iframe.contentWindow.document;
            var headNode = insideFrame.getElementsByTagName('head')[0];

            // Loading CSS stylesheet

            var linkElement = document.createElement('link');
            linkElement.type = 'text/css';
            linkElement.rel = 'stylesheet';
            linkElement.href = "{/literal}{$themePath|escape:"javascript"}{literal}/templates/plugins/generic/htmlArticleGalley/css/default.css";
            headNode.appendChild(linkElement);

            // Google Fonts

	        var linkFont= document.createElement('link');
	        linkFont.rel = 'stylesheet';
	        linkFont.href = "https://fonts.googleapis.com/css?family=PT+Serif";
	        headNode.appendChild(linkFont);
        };

		{/literal}</script>

{/if}
</body>
</html>
