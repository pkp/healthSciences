{**
 * templates/frontend/pages/orcidVerify.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2000-2024 John Willinsky
 * Copyright (c) 2018-2019 University Library Heidelberg
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Page template to display from the OrcidHandler to show ORCID verification success or failure.
 *}
{include file="frontend/components/header.tpl"}

<div class="container page page-about">
	<h1>
		{translate key="orcid.verify.title"}
	</h1>
	<div class="description">
		{if $verifySuccess}
			<p>
				<span class="orcid"><a href="{$orcid|escape}" target="_blank">{$orcidIcon}{$orcid|escape}</a></span>
			</p>
			<p class="orcid-success">
				{translate key="orcid.verify.success"}
			</p>
			{if $sendSubmission}
				{if $sendSubmissionSuccess}
					<p class="orcid-success">
						{translate key="orcid.verify.sendSubmissionToOrcid.success"}
					</p>
				{else}
					<p class="orcid-failure">
						{translate key="orcid.verify.sendSubmissionToOrcid.failure"}
					</p>
				{/if}
			{elseif $submissionNotPublished}
				{translate key="orcid.verify.sendSubmissionToOrcid.notpublished"}
			{/if}
			<p class='orcid-redirect'>
				{translate key="orcid.verify.success.redirect" contextName=$contextName}
			</p>
		{else}
			<p class="orcid-failure">
				{if $orcidAPIError}
					{$orcidAPIError}
				{/if}
				{if $invalidClient}
					{translate key="orcid.invalidClient"}
				{elseif $duplicateOrcid}
					{translate key="orcid.verify.duplicateOrcid"}
				{elseif $denied}
					{translate key="orcid.authDenied"}
				{elseif $authFailure}
					{translate key="orcid.authFailure"}
				{else}
					{translate key="orcid.verify.failure"}
				{/if}
			</p>
			{translate key="orcid.failure.contact"}
		{/if}
	</div>
</div>

{include file="frontend/components/footer.tpl"}

{if $verifySuccess}
	<script type="text/javascript">
		setTimeout(function() {
			window.location.href = "{$currentUrl}";
		}, 10000); // 10 seconds
	</script>
	<style>
		.orcid-redirect {
			font-weight: bold;
			margin-top: 0.50rem;
		}
	</style>
{/if}
