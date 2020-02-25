{**
 * templates/frontend/components/navigationMenu.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Navigation menu template
 *
 * @uses navigationMenu array Hierarchical array of navigation menu item assignments
 * @uses id string Element ID to assign the outer <ul>
 * @uses ulClass string Class name(s) to assign the outer <ul>
 * @uses liClass string Class name(s) to assign all <li> elements
 *}

{if $navigationMenu}
	<ul id="{$id|escape}" class="{$ulClass|escape}">
		{foreach key=field item=navigationMenuItemAssignment from=$navigationMenu->menuTree}
			{if !$navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
				{continue}
			{/if}
			{assign var="hasChildren" value=false}
			{if !empty($navigationMenuItemAssignment->children)}
				{assign var="hasChildren" value=true}
			{/if}
			<li class="{$liClass|escape} {$navigationMenuItemAssignment->navigationMenuItem->getType()|lower}{if $hasChildren} dropdown{/if}">
				<a href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}"
					class="nav-link{if $hasChildren} dropdown-toggle{/if}"
					{if $hasChildren}
						id="{'navMenuDropdown'|concat:$field}"
						data-toggle="dropdown"
						aria-haspopup="true"
						aria-expanded="false"
					{/if}
				>
					{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
				</a>
				{if $hasChildren}
					<div class="dropdown-menu{if $id === 'userNav'} dropdown-menu-right{/if}" aria-labelledby="{'navMenuDropdown'|concat:$field}">
						{foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
							{if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
								<a class="dropdown-item" href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}">
									{$childNavigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
								</a>
							{/if}
						{/foreach}
					</div>
				{/if}
			</li>
		{/foreach}
	</ul>
{/if}
