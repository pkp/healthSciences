{**
 * templates/frontend/pages/announcements.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the latest announcements
 *
 * @uses $announcements array List of announcements
 *}
{include file="frontend/components/header.tpl" pageTitle="announcement.announcements"}

<div class="container">
  <div class="row justify-content-md-center">
    <div class="col-md-6">
    	{include file="frontend/components/editLink.tpl" page="management" op="settings" path="website" anchor="announcements" sectionTitleKey="announcement.announcements"}

      <div>{$currentContext->getLocalizedName()}</div>
      <h1>{translate key="announcement.announcements"}</h1>
      <hr>

      {$announcementsIntroduction}

    	{include file="frontend/components/announcements.tpl"}
    </div>
  </div>
</div>

{include file="frontend/components/footer.tpl"}
