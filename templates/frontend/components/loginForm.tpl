{**
 * templates/frontend/components/registrationForm.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the basic registration form fields
 *
 * @uses $loginUrl string URL to post the login request
 * @uses $source string Optional URL to redirect to after successful login
 * @uses $username string Username
 * @uses $password string Password
 * @uses $remember boolean Should logged in cookies be preserved on this computer
 * @uses $disableUserReg boolean Can users register for this site?
 *}
{if $formType && $formType === "loginPage"}
	{assign var=usernameId value="username"}
	{assign var=passwordId value="password"}
	{assign var=rememberId value="remember"}
{elseif $formType && $formType === "loginModal"}
	{assign var=usernameId value="usernameModal"}
	{assign var=passwordId value="passwordModal"}
	{assign var=rememberId value="rememberModal"}
{/if}
<form class="form-login" method="post" action="{$loginUrl}">
	{csrf}
	<input type="hidden" name="source" value="{$source|strip_unsafe_html|escape}"/>

	<fieldset>
		<div class="form-group form-group-username">
			<label for="{$usernameId}">
				{translate key="user.username"}
				<span class="required" aria-hidden="true">*</span>
				<span class="sr-only">
					{translate key="common.required"}
				</span>
			</label>
			<input type="text" class="form-control" name="username" id="{$usernameId}" value="{$username|escape}"
			       maxlength="32" required>
		</div>
		<div class="form-group form-group-password">
			<label for="{$passwordId}">
				{translate key="user.password"}
				<span class="required" aria-hidden="true">*</span>
				<span class="sr-only">
					{translate key="common.required"}
				</span>
			</label>
			<input type="password" class="form-control" name="password" id="{$passwordId}" value="{$password|escape}"
			       maxlength="32" required>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="form-group form-group-forgot">
					<small class="form-text">
						<a href="{url page="login" op="lostPassword"}">
							{translate key="user.login.forgotPassword"}
						</a>
					</small>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group form-check form-group-remember">
					<input type="checkbox" class="form-check-input" name="remember" id="{$rememberId}" value="1"
					       checked="$remember">
					<label for="{$rememberId}" class="form-check-label">
						<small class="form-text">
							{translate key="user.login.rememberUsernameAndPassword"}
						</small>
					</label>
				</div>
			</div>
		</div>
		<div class="form-group form-group-buttons">
			<button class="btn btn-primary" type="submit">
				{translate key="user.login"}
			</button>
		</div>
		{if !$disableUserReg}
			<div class="form-group form-group-register">
				{translate key="plugins.themes.healthSciences.register.noAccount"}
				{capture assign=registerUrl}{url page="user" op="register" source=$source}{/capture}
				<a href="{$registerUrl}">
					{translate key="plugins.themes.healthSciences.register.registerHere"}
				</a>
			</div>
		{/if}
	</fieldset>
</form>
