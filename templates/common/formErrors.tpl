{**
 * templates/common/formErrors.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2000-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief List errors that occurred during form processing.
 *
 * @uses $isError bool If an error exists
 * @uses $errors array List of error messages
 *}
{if $isError}
	<div class="alert alert-danger">
		<div>
			{translate key="form.errorsOccurred"}
		</div>
		<ul class="form-error-list">
			{foreach key=field item=message from=$errors}
				<li>
					<a href="#{$field|escape}">{$message}</a>
				</li>
			{/foreach}
		</ul>
	</div>
	<script>{literal}
		<!--
		// Jump to form errors.
		window.location.hash="formErrors";
		// -->
	{/literal}</script>
{/if}
