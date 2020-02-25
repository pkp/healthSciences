{**
 * templates/frontend/pages/userLogin.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2000-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User login form.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.login"}

<div class="container page-login">
	<div class="row page-header justify-content-md-center">
		<div class="col-md-8">
			<h1>{translate key="user.login"}</h1>
		</div>
	</div>
	<div class="row justify-content-md-center">
		<div class="col-md-8">
			<div class="page-content">

				{* A login message may be displayed if the user was redireceted to the
				   login page from another request. Examples include if login is required
				   before dowloading a file. *}
				{if $loginMessage}
					<p>
						{translate key=$loginMessage}
					</p>
				{/if}

				{if $error}
					<div class="alert alert-danger" role="alert">
						{translate key=$error reason=$reason}
					</div>
				{/if}

				{include file="frontend/components/loginForm.tpl" formType = "loginPage"}

			</div>
		</div>
	</div>
</div>
{include file="frontend/components/footer.tpl"}
