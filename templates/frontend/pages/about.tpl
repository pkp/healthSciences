{**
 * templates/frontend/pages/about.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view a journal's or press's description, contact
 *  details, policies and more.
 *
 * @uses $currentContext Journal|Press The current journal or press
 *}
{include file="frontend/components/header.tpl" pageTitle="about.aboutContext"}

<div class="container">
  <div class="row justify-content-md-center">
    <div class="col-md-6">
    	{include file="frontend/components/editLink.tpl" page="management" op="settings" path="context" anchor="masthead" sectionTitleKey="about.aboutContext"}

      <div>{$currentContext->getLocalizedName()}</div>
      <h1>{translate key="about.aboutContext"}</h1>
      <hr>

    	{$currentContext->getLocalizedSetting('about')}
    </div>
  </div>
</div>

{include file="frontend/components/footer.tpl"}
