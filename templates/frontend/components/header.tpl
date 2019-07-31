{**
 * templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2016 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *}

{* Determine whether a logo or title string is being displayed *}
{assign var="showingLogo" value=true}
{if $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
	{assign var="showingLogo" value=false}
{/if}

{capture assign="homeUrl"}
	{if $currentJournal && $multipleContexts}
		{url page="index" router=$smarty.const.ROUTE_PAGE}
	{else}
		{url context="index" router=$smarty.const.ROUTE_PAGE}
	{/if}
{/capture}

{* Logo or site title. Only use <h1> heading on the homepage.
	 Otherwise that should go to the page title. *}
{if $requestedOp == 'index'}
	{assign var="siteNameTag" value="h1"}
{else}
	{assign var="siteNameTag" value="div"}
{/if}

{* Determine whether to show a logo of site title *}
{capture assign="brand"}{strip}
	{if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
		<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}"
		     {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"
		     {else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if}
				 class="img-fluid">
	{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
		<span class="navbar-logo-text">{$displayPageHeaderTitle}</span>
	{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_array($displayPageHeaderTitle)}
		<img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}"
		     alt="{$displayPageHeaderTitle.altText|escape}"
				 class="img-fluid">
	{else}
		<img src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" class="img-fluid">
	{/if}
{/strip}{/capture}

<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}{/if}
{include file="frontend/components/headerHead.tpl"}
<body dir="{$currentLocaleLangDir|escape|default:"ltr"}">

{* Header *}
<header class="main-header">
	<div class="container">

		<{$siteNameTag} class="sr-only">{$pageTitleTranslated|escape}</{$siteNameTag}>

	<div class="navbar-logo">
		<a href="{$homeUrl}">{$brand}</a>
	</div>

	{* Main navigation *}
	<nav class="navbar navbar-expand-lg navbar-light">
		<a class="navbar-brand" href="{$homeUrl}">{$brand}</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-navbar"
		        aria-controls="main-navbar" aria-expanded="false"
		        aria-label="{translate key="plugins.themes.healthSciences.nav.toggle"}">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse justify-content-md-center" id="main-navbar">
			{* primary menu *}
			{capture assign="primaryMenu"}
				{load_menu name="primary" id="primaryNav" ulClass="navbar-nav" liClass="nav-item"}
			{/capture}
			{if !empty(trim($primaryMenu)) || $currentContext}
				{$primaryMenu}
			{/if}
			{* user menu *}
			{load_menu name="user" id="primaryNav-userNav" ulClass="navbar-nav" liClass="nav-item"}
			{include file="frontend/components/languageSwitcher.tpl" id="languageSmallNav"}
		</div>
	</nav>

	{* Repeat the userNav for positioning on large screens *}
	{load_menu name="user" id="userNav" ulClass="navbar-nav" liClass="nav-item"}

	{* Language switcher *}
	{include file="frontend/components/languageSwitcher.tpl" id="languageLargeNav"}

	</div>
</header>
