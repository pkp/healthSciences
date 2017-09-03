{**
 * templates/frontend/components/primaryNavMenu.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Primary navigation menu list for OJS
 *}
<ul class="navbar-nav">

	{if $enableAnnouncements}
		<li class="nav-item">
			<a class="nav-link" href="{url router=$smarty.const.ROUTE_PAGE page="announcement"}">
				{translate key="announcement.announcements"}
			</a>
		</li>
	{/if}

	{if $currentJournal}
		{if $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
			<li class="nav-item">
				<a class="nav-link" href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="current"}">
					{translate key="navigation.current"}
				</a>
			</li>
			<li class="nav-item">
				<a  class="nav-link"href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}">
					{translate key="navigation.archives"}
				</a>
			</li>
		{/if}

		<li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="{url router=$smarty.const.ROUTE_PAGE page="about"}" id="dropdown-about" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{translate key="navigation.about"}</a>
      <div class="dropdown-menu" aria-labelledby="dropdown-about">
        <a class="dropdown-item" href="{url router=$smarty.const.ROUTE_PAGE page="about"}">{translate key="about.aboutContext"}</a>
        {if $currentJournal->getLocalizedSetting('masthead')}
					<a class="dropdown-item" href="{url router=$smarty.const.ROUTE_PAGE page="about" op="editorialTeam"}">
						{translate key="about.editorialTeam"}
					</a>
				{/if}
        <a class="dropdown-item" href="{url router=$smarty.const.ROUTE_PAGE page="about" op="submissions"}">
          {translate key="about.submissions"}
        </a>
        {if $currentJournal->getLocalizedSetting('masthead')}
					<a class="dropdown-item" href="{url router=$smarty.const.ROUTE_PAGE page="about" op="editorialTeam"}">
						{translate key="about.editorialTeam"}
					</a>
				{/if}
        {if $currentJournal->getSetting('mailingAddress') || $currentJournal->getSetting('contactName')}
					<a class="dropdown-item" href="{url router=$smarty.const.ROUTE_PAGE page="about" op="contact"}">
						{translate key="about.contact"}
					</a>
				{/if}
      </div>
		</li>
	{/if}

  {* Search form *}
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="{url router=$smarty.const.ROUTE_PAGE page="about"}" id="dropdown-search" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{translate key="common.search"}</a>
    <div class="dropdown-menu" aria-labelledby="dropdown-search">
      {if !$noContextsConfigured}
        {include file="frontend/components/searchForm_simple.tpl"}
      {/if}
    </div>
  </li>
</ul>
