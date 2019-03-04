{**
 * templates/frontend/components/registrationFormContexts.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display role selection for all of the journals/presses on this site
 *
 * @uses $contexts array List of journals/presses on this site
 * @uses $readerUserGroups array Associative array of user groups with reader
 *  permissions in each context.
 * @uses $authorUserGroups array Associative array of user groups with author
 *  permissions in each context.
 * @uses $reviewerUserGroups array Associative array of user groups with reviewer
 *  permissions in each context.
 * @uses $userGroupIds array List group IDs this user is assigned
 *}

{* Only display the context role selection when registration is taking place
   outside of the context of any one journal/press. *}
{if !$currentContext}

	{* Allow users to register for any journal/press on this site *}
	<fieldset class="contexts">
		<legend>
			{translate key="user.register.contextsPrompt"}
		</legend>
		<div class="list-group" id="contextOptinGroup">
			{foreach from=$contexts item=context}
				{assign var=contextId value=$context->getId()}
				{assign var=isSelected value=false}
				<div class="list-group-item">
					<div class="list-group-item-heading">
						{$context->getLocalizedName()}
					</div>
					<p>
						{translate key="user.register.otherContextRoles"}
					</p>
					<div class="form-group">
						<div class="roles">
							{foreach from=$readerUserGroups[$contextId] item=userGroup}
								{if $userGroup->getPermitSelfRegistration()}
									{assign var="userGroupId" value=$userGroup->getId()}
									<div class="form-check">
										<input type="checkbox" class="form-check-input" id="readerGroup[{$userGroupId}]" name="readerGroup[{$userGroupId}]"{if in_array($userGroupId, $userGroupIds)} checked="checked"{/if}>
										<label for="readerGroup[{$userGroupId}]">
											{$userGroup->getLocalizedName()|escape}
										</label>
										{if in_array($userGroupId, $userGroupIds)}
											{assign var=isSelected value=true}
										{/if}
									</div>
								{/if}
							{/foreach}
							{foreach from=$reviewerUserGroups[$contextId] item=userGroup}
								{if $userGroup->getPermitSelfRegistration()}
									{assign var="userGroupId" value=$userGroup->getId()}
									<div class="form-check">
										<input type="checkbox" class="form-check-input" id="reviewerGroup[{$userGroupId}]" name="reviewerGroup[{$userGroupId}]"{if in_array($userGroupId, $userGroupIds)} checked="checked"{/if}>
										<label for="reviewerGroup[{$userGroupId}]">
											{$userGroup->getLocalizedName()|escape}
										</label>
										{if in_array($userGroupId, $userGroupIds)}
											{assign var=isSelected value=true}
										{/if}
									</div>
								{/if}
							{/foreach}
						</div>
						{* Require the user to agree to the terms of the context's privacy policy *}
						{if !$enableSiteWidePrivacyStatement && $context->getSetting('privacyStatement')}
							<div class="form-check context_privacy{if $isSelected} context_privacy_visible{/if}">
								<input type="checkbox" class="form-check-input" name="privacyConsent[{$contextId}]" id="privacyConsent[{$contextId}]" value="1"{if $privacyConsent[$contextId]} checked="checked"{/if}>
								<label for="privacyConsent[{$contextId}]">
									{capture assign="privacyUrl"}{url router=$smarty.const.ROUTE_PAGE context=$context->getPath() page="about" op="privacy"}{/capture}
									{translate key="user.register.form.privacyConsentThisContext" privacyUrl=$privacyUrl}
								</label>
							</div>
						{/if}
					</div>
				</div>
			{/foreach}
		</div>
	</fieldset>
{/if}
