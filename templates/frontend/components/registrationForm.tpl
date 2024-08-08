{**
 * templates/frontend/components/registrationForm.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
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
					<span class="visually-hidden">
						{translate key="common.required"}
					</span>
				</label>
				<input class="form-control" type="text" name="givenName" id="givenName" autocomplete="given-name" value="{$givenName|default:""|escape}" maxlength="255" required>
			</div>
			<div class="form-group">
				<label for="familyName">
					{translate key="user.familyName"}
				</label>
				<input class="form-control" type="text" name="familyName" id="familyName" autocomplete="family-name" value="{$familyName|default:""|escape}" maxlength="255">
			</div>
			<div class="form-group">
				<label for="affiliation">
					{translate key="user.affiliation"}
					<span class="required" aria-hidden="true">*</span>
					<span class="visually-hidden">
						{translate key="common.required"}
					</span>
				</label>
				<input class="form-control" type="text" name="affiliation" id="affiliation" autocomplete="organization" value="{$affiliation|default:""|escape}" required>
			</div>
			<div class="form-group">
				<label for="country">
					{translate key="common.country"}
					<span class="required" aria-hidden="true">*</span>
					<span class="visually-hidden">
						{translate key="common.required"}
					</span>
				</label>
				<select class="form-control" name="country" id="country" autocomplete="country-name" required>
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
					<span class="visually-hidden">
						{translate key="common.required"}
					</span>
				</label>
				<input class="form-control" type="email" name="email" id="email" value="{$email|default:""|escape}" maxlength="90" autocomplete="email" required>
			</div>
			<div class="form-group">
				<label for="username">
					{translate key="user.username"}
					<span class="required" aria-hidden="true">*</span>
					<span class="visually-hidden">
						{translate key="common.required"}
					</span>
				</label>
				<input class="form-control" type="text" name="username" id="username" value="{$username|default:""|escape}" maxlength="32" autocomplete="username" required>
			</div>
			<div class="form-group">
				<label for="password">
					{translate key="user.password"}
					<span class="required" aria-hidden="true">*</span>
					<span class="visually-hidden">
						{translate key="common.required"}
					</span>
				</label>
				<input class="form-control" type="password" name="password" id="password" password="true" maxlength="32" autocomplete="new-password" required>
			</div>
			<div class="form-group">
				<label for="password2">
					{translate key="user.repeatPassword"}
					<span class="required" aria-hidden="true">*</span>
					<span class="visually-hidden">
						{translate key="common.required"}
					</span>
				</label>
				<input class="form-control" type="password" name="password2" id="password2" password="true" maxlength="32" autocomplete="new-password" required>
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
						<div class="optin optin-privacy form-check">
							<input type="checkbox" class="form-check-input" name="privacyConsent" id="privacyConsent" value="1"{if $privacyConsent} checked="checked"{/if}>
							<label for="privacyConsent" class="form-check-label">
								{capture assign="privacyUrl"}{url router=$smarty.const.ROUTE_PAGE page="about" op="privacy"}{/capture}
								{translate key="user.register.form.privacyConsent" privacyUrl=$privacyUrl}
							</label>
						</div>
					</div>
				{/if}
				{* Ask the user to opt into public email notifications *}
				<div class="fields">
					<div class="optin optin-email form-check">
						<input type="checkbox" class="form-check-input" name="emailConsent" id="emailConsent" value="1"{if $emailConsent} checked="checked"{/if}>
						<label for="emailConsent" class="form-check-label">
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
							<label for="interests">
								{translate key="user.interests"}
							</label>
						</div>
						<input type="text" name="interests" id="interests" value="{$interests|default:""|escape}">
					</div>
				</fieldset>
			{/if}
		{/if}
	</div>
</div>
