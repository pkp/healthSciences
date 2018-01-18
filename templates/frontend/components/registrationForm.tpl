{**
 * templates/frontend/components/registrationForm.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
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
				<label for="firstName">
					{translate key="user.firstName"}
					<span class="required" aria-hidden="true">*</span>
					<span class="sr-only">
						{translate key="common.required"}
					</span>
				</label>
				<input class="form-control" type="text" name="firstName" id="firstName" value="{$firstName|escape}" maxlength="40" required>
			</div>
			<div class="form-group">
				<label for="middleName">
					{translate key="user.middleName"}
				</label>
				<input class="form-control" type="text" name="middleName" value="{$middleName|escape}" maxlength="40">
			</div>
			<div class="form-group">
				<label for="lastName">
					{translate key="user.lastName"}
					<span class="required" aria-hidden="true">*</span>
					<span class="sr-only">
						{translate key="common.required"}
					</span>
				</label>
				<input class="form-control" type="text" name="lastName" id="lastName" value="{$lastName|escape}" maxlength="40" required>
			</div>
			<div class="form-group">
				<label for="affiliation">
					{translate key="user.affiliation"}
					<span class="required" aria-hidden="true">*</span>
					<span class="sr-only">
						{translate key="common.required"}
					</span>
				</label>
				<input class="form-control" type="text" name="affiliation[{$primaryLocale|escape}]" id="affiliation" value="{$affiliation.$primaryLocale|escape}" required>
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

		{* When a user is registering with a specific journal *}
		{if $currentContext}

			{* Users are opted into the Reader and Author roles in the current
				 journal/press by default. See RegistrationForm::initData() *}
			{assign var=contextId value=$currentContext->getId()}
			{foreach from=$readerUserGroups[$contextId] item=userGroup}
				{if in_array($userGroup->getId(), $userGroupIds)}
					{assign var="userGroupId" value=$userGroup->getId()}
					<input type="hidden" name="readerGroup[{$userGroupId}]" value="1">
				{/if}
			{/foreach}
			{foreach from=$authorUserGroups[$contextId] item=userGroup}
				{if in_array($userGroup->getId(), $userGroupIds)}
					{assign var="userGroupId" value=$userGroup->getId()}
					<input type="hidden" name="authorGroup[{$userGroupId}]" value="1">
				{/if}
			{/foreach}

			{* Allow the user to sign up as a reviewer *}
			{assign var=userCanRegisterReviewer value=0}
			{foreach from=$reviewerUserGroups[$contextId] item=userGroup}
				{if $userGroup->getPermitSelfRegistration()}
					{assign var=userCanRegisterReviewer value=$userCanRegisterReviewer+1}
				{/if}
			{/foreach}
			{if $userCanRegisterReviewer}
				<fieldset class="reviewer">
					<legend>
						{translate key="user.reviewerPrompt"}
					</legend>
					<div id="reviewerOptinGroup" class="form-group">
						{foreach from=$reviewerUserGroups[$contextId] item=userGroup}
							{if $userGroup->getPermitSelfRegistration()}
								<div class="form-check">
									<input type="checkbox" class="form-check-input" name="reviewerGroup[{$userGroup->getId()}]" id="reviewerGroup-{$userGroup->getId()}" value="1"{if in_array($userGroup->getId(), $userGroupIds)} checked="checked"{/if}>
									<label for="reviewerGroup-{$userGroup->getId()}" class="form-check-label">
										{translate key="user.reviewerPrompt.userGroup" userGroup=$userGroup->getLocalizedName()}
									</label>
								</div>
							{/if}
						{/foreach}
					</div>
				</fieldset>
			{/if}
		{/if}
	</div>
</div>
