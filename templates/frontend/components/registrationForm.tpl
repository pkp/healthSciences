{**
 * templates/frontend/components/registrationForm.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the basic registration form fields
 *
 * @uses $locale string Locale key to use in the affiliate field
 * @uses $firstName string First name input entry if available
 * @uses $middleName string Middle name input entry if available
 * @uses $lastName string Last name input entry if available
 * @uses $countries array List of country options
 * @uses $country string The selected country if available
 * @uses $email string Email input entry if available
 * @uses $username string Username input entry if available
 *}
<div class="row justify-content-md-center">
	<div class="col-lg-6">
		<fieldset class="identity">
			<legend>
				{translate key="user.profile"}
			</legend>
			<div class="form-group">
				<label for="givenName">
					{translate key="user.givenName"}
					<span class="required" aria-hidden="true">*</span>
					<span class="sr-only">
						{translate key="common.required"}
					</span>
				</label>
				<input class="form-control" type="text" name="givenName" id="givenName" value="{$givenName|escape}" maxlength="255" required>
			</div>
			<div class="form-group">
				<label for="familyName">
					{translate key="user.familyName"}
				</label>
				<input class="form-control" type="text" name="familyName" value="{$familyName|escape}" maxlength="255">
			</div>
			<div class="form-group">
				<label for="affiliation">
					{translate key="user.affiliation"}
					<span class="required" aria-hidden="true">*</span>
					<span class="sr-only">
						{translate key="common.required"}
					</span>
				</label>
				<input class="form-control" type="text" name="affiliation" id="affiliation" value="{$affiliation|escape}" required>
			</div>
			<div class="form-group">
				<label for="country">
					{translate key="common.country"}
					<span class="required" aria-hidden="true">*</span>
					<span class="sr-only">
						{translate key="common.required"}
					</span>
				</label>
				<select class="form-control" name="country" id="country" required>
					<option></option>
					{html_options options=$countries selected=$country}
				</select>
			</div>
		</fieldset>
	</div>
	<div class="col-lg-6">
		<fieldset class="login">
			<legend>
				{translate key="user.login"}
			</legend>
			<div class="form-group">
				<label for="email">
					{translate key="user.email"}
					<span class="required" aria-hidden="true">*</span>
					<span class="sr-only">
						{translate key="common.required"}
					</span>
				</label>
				<input class="form-control" type="text" name="email" id="email" value="{$email|escape}" maxlength="90" required>
			</div>
			<div class="form-group">
				<label for="username">
					{translate key="user.username"}
					<span class="required" aria-hidden="true">*</span>
					<span class="sr-only">
						{translate key="common.required"}
					</span>
				</label>
				<input class="form-control" type="text" name="username" id="username" value="{$username|escape}" maxlength="32" required>
			</div>
			<div class="form-group">
				<label for="password">
					{translate key="user.password"}
					<span class="required" aria-hidden="true">*</span>
					<span class="sr-only">
						{translate key="common.required"}
					</span>
				</label>
				<input class="form-control" type="password" name="password" id="password" password="true" maxlength="32" required>
			</div>
			<div class="form-group">
				<label for="password2">
					{translate key="user.repeatPassword"}
					<span class="required" aria-hidden="true">*</span>
					<span class="sr-only">
						{translate key="common.required"}
					</span>
				</label>
				<input class="form-control" type="password" name="password2" id="password2" password="true" maxlength="32" required>
			</div>
		</fieldset>
	</div>
	<div class="col-lg-12">
		{* When a user is registering with a specific journal *}
		{if $currentContext}

			<fieldset class="consent">
				{if $currentContext->getSetting('privacyStatement')}
					{* Require the user to agree to the terms of the privacy policy *}
					<div class="fields">
						<div class="optin optin-privacy">
							<label>
								<input type="checkbox" name="privacyConsent" value="1"{if $privacyConsent} checked="checked"{/if}>
								{capture assign="privacyUrl"}{url router=$smarty.const.ROUTE_PAGE page="about" op="privacy"}{/capture}
								{translate key="user.register.form.privacyConsent" privacyUrl=$privacyUrl}
							</label>
						</div>
					</div>
				{/if}
				{* Ask the user to opt into public email notifications *}
				<div class="fields">
					<div class="optin optin-email">
						<label>
							<input type="checkbox" name="emailConsent" value="1"{if $emailConsent} checked="checked"{/if}>
							{translate key="user.register.form.emailConsent"}
						</label>
					</div>
				</div>
			</fieldset>

			{* Allow the user to sign up as a reviewer *}
			{assign var=contextId value=$currentContext->getId()}
			{assign var=userCanRegisterReviewer value=0}
			{foreach from=$reviewerUserGroups[$contextId] item=userGroup}
				{if $userGroup->getPermitSelfRegistration()}
					{assign var=userCanRegisterReviewer value=$userCanRegisterReviewer+1}
				{/if}
			{/foreach}
			{if $userCanRegisterReviewer}
				<fieldset class="reviewer">
					{if $userCanRegisterReviewer > 1}
						<legend>
							{translate key="user.reviewerPrompt"}
						</legend>
						{capture assign="checkboxLocaleKey"}user.reviewerPrompt.userGroup{/capture}
					{else}
						{capture assign="checkboxLocaleKey"}user.reviewerPrompt.optin{/capture}
					{/if}
					<div id="reviewerOptinGroup" class="form-group">
						{foreach from=$reviewerUserGroups[$contextId] item=userGroup}
							{if $userGroup->getPermitSelfRegistration()}
								<div class="form-check">
									<input type="checkbox" class="form-check-input if-reviewer-checkbox" name="reviewerGroup[{$userGroup->getId()}]" id="reviewerGroup-{$userGroup->getId()}" value="1"{if in_array($userGroup->getId(), $userGroupIds)} checked="checked"{/if}>
									<label for="reviewerGroup-{$userGroup->getId()}" class="form-check-label">
										{translate key=$checkboxLocaleKey userGroup=$userGroup->getLocalizedName()|escape}
									</label>
								</div>
							{/if}
						{/foreach}
					</div>

					{* review interests (with modified tag-it library) *}
					<div id="reviewerInterests" class="reviewer_interests hidden">
						<div class="label">
							{translate key="user.interests"}
						</div>
						<ul id="tagitInput" class="interests tag-it" data-field-name="interests[]" data-autocomplete-url="{url|escape router=$smarty.const.ROUTE_PAGE page='user' op='getInterests'}">
							{foreach from=$interests item=interest}
								<li>{$interest|escape}</li>
							{/foreach}
						</ul>
					</div>
				</fieldset>
			{/if}
		{/if}
	</div>
</div>
