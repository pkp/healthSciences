{**
 * lib/pkp/templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}

{* Determine whether a logo or title string is being displayed *}
{assign var="showingLogo" value=true}
{if $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
	{assign var="showingLogo" value=false}
{/if}

<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{translate|assign:"pageTitleTranslated" key=$pageTitle}{/if}
{include file="frontend/components/headerHead.tpl"}
<body>
	<div>

		{* Header *}
		<header class="main-header">

        <div class="navbar-logo">
          {* Logo or site title. Only use <h1> heading on the homepage.
             Otherwise that should go to the page title. *}
          {if $requestedOp == 'index'}
            <h1>
          {else}
            <div>
          {/if}
            {if $currentJournal && $multipleContexts}
              {url|assign:"homeUrl" journal="index" router=$smarty.const.ROUTE_PAGE}
            {else}
              {url|assign:"homeUrl" page="index" router=$smarty.const.ROUTE_PAGE}
            {/if}
            {if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
              <a href="{$homeUrl}">
                <img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />
              </a>
            {elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
              <a href="{$homeUrl}">{$displayPageHeaderTitle}</a>
            {elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_array($displayPageHeaderTitle)}
              <a href="{$homeUrl}">
                <img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" alt="{$displayPageHeaderTitle.altText|escape}" width="{$displayPageHeaderTitle.width|escape}" height="{$displayPageHeaderTitle.height|escape}" />
              </a>
            {else}
              <a href="{$homeUrl}">
                <img src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" width="180" height="90" />
              </a>
            {/if}
          {if $requestedOp == 'index'}
            </h1>
          {else}
            </div>
          {/if}
        </div>

        {* Main navigation *}
        <nav class="navbar navbar-expand-lg">
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-navbar" aria-controls="main-navbar" aria-expanded="false" aria-label="Toggle navigation">
            Menu
          </button>

          <div class="collapse navbar-collapse justify-content-md-center" id="main-navbar">
						{load_menu name="primary" ulClass="navbar-nav" liClass="nav-item"}
						{load_menu name="user" ulClass="navbar-nav" liClass="nav-item"}
          </div>
        </nav>

		</header>

		{* Wrapper for page content and sidebars *}
		{if $isFullWidth}
			{assign var=hasLeftSidebar value=0}
		{/if}
		<div>

			<div>
