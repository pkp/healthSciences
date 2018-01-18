{**
 * templates/frontend/components/registrationForm.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
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
 <form class="form-login" method="post" action="{$loginUrl}">
	{csrf}
	<input type="hidden" name="source" value="{$source|strip_unsafe_html|escape}" />

	<fieldset>
		<div class="form-group form-group-username">
			<label for="username">
				{translate key="user.username"}
				<span class="required" aria-hidden="true">*</span>
				<span class="sr-only">
					{translate key="common.required"}
				</span>
			</label>
			<input type="text" class="form-control" name="username" id="username" value="{$username|escape}" maxlength="32" required>
		</div>
		<div class="form-group form-group-password">
			<label for="password">
				{translate key="user.password"}
				<span class="required" aria-hidden="true">*</span>
				<span class="sr-only">
					{translate key="common.required"}
				</span>
			</label>
			<input type="text" class="form-control" name="password" id="password" value="{$password|escape}" maxlength="32" required>
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
          <input type="checkbox" class="form-check-input" name="remember" id="remember" value="1" checked="$remember">
          <label for="remember" class="form-check-label" for="remember">
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
				{url|assign:registerUrl page="user" op="register" source=$source}
				<a href="{$registerUrl}">
					{translate key="plugins.themes.healthSciences.register.registerHere"}
				</a>
      </div>
    {/if}
	</fieldset>
</form>
