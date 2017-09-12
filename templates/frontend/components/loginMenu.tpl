{**
 * templates/frontend/components/loginMenu.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Register / login menu for OJS
 *}

{if $isUserLoggedIn}
  <li class="nav-item dropdown {if $unreadNotificationCount} has_tasks{/if}" aria-haspopup="true" aria-expanded="false">
    <a href="{url router=$smarty.const.ROUTE_PAGE page="submissions"}" class="nav-link dropdown-toggle" id="dropdown-login" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      {$loggedInUsername|escape}
      <span class="task_count">
        {$unreadNotificationCount}
      </span>
    </a>
    <div class="dropdown-menu" aria-labelledby="dropdown-login">
      {if array_intersect(array(ROLE_ID_MANAGER, ROLE_ID_ASSISTANT, ROLE_ID_REVIEWER, ROLE_ID_AUTHOR), (array)$userRoles)}
        <a href="{url router=$smarty.const.ROUTE_PAGE page="submissions"}" class="dropdown-item">
          {translate key="navigation.dashboard"}
          <span class="task_count">
            {$unreadNotificationCount}
          </span>
        </a>
      {/if}
      <a href="{url router=$smarty.const.ROUTE_PAGE page="user" op="profile"}" class="dropdown-item">
        {translate key="common.viewProfile"}
      </a>
      {if array_intersect(array(ROLE_ID_SITE_ADMIN), (array)$userRoles)}
      <a href="{if $multipleContexts}{url router=$smarty.const.ROUTE_PAGE context="index" page="admin" op="index"}{else}{url router=$smarty.const.ROUTE_PAGE page="admin" op="index"}{/if}" class="dropdown-item">
        {translate key="navigation.admin"}
      </a>
      {/if}
      <a href="{url router=$smarty.const.ROUTE_PAGE page="login" op="signOut"}" class="dropdown-item">
        {translate key="user.logOut"}
      </a>
      {if $isUserLoggedInAs}
        <a href="{url router=$smarty.const.ROUTE_PAGE page="login" op="signOutAsUser"}" class="dropdown-item">
          {translate key="user.logOutAs"} {$loggedInUsername|escape}
        </a>
      {/if}
    </div>
  </li>
{else}
  {if !$disableUserReg}
    <li class="nav-item">
      <a href="{url router=$smarty.const.ROUTE_PAGE page="user" op="register"}" class="nav-link">
        {translate key="navigation.register"}
      </a>
    </li>
  {/if}
  <li class="nav-item">
    <a href="{url router=$smarty.const.ROUTE_PAGE page="login"}" class="nav-link">
      {translate key="navigation.login"}
    </a>
  </li>
{/if}
