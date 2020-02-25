{**
 * templates/frontend/pages/submissions.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the editorial team.
 *
 * @uses $currentContext Journal|Press The current journal or press
 * @uses $submissionChecklist array List of requirements for submissions
 *}
{include file="frontend/components/header.tpl" pageTitle="about.submissions"}

<div class="container page-submissions">
	<div class="row page-header justify-content-md-center">
		<div class="col-md-8">
			<h1>{translate key="about.submissions"}</h1>
		</div>
	</div>
	<div class="row justify-content-md-center">
		<div class="col-md-8">
			<div class="page-content">

				{* Login/register prompt *}
				{if $isUserLoggedIn}
					{capture assign="newSubmission"}<a href="{url page="submission" op="wizard"}">{translate key="about.onlineSubmissions.newSubmission"}</a>{/capture}
					{capture assign="viewSubmissions"}<a href="{url page="submissions"}">{translate key="about.onlineSubmissions.viewSubmissions"}</a>{/capture}
					<div class="alert alert-primary">
						{translate key="about.onlineSubmissions.submissionActions" newSubmission=$newSubmission viewSubmissions=$viewSubmissions}
					</div>
				{else}
					{capture assign="login"}<a href="{url page="login"}">{translate key="about.onlineSubmissions.login"}</a>{/capture}
					{capture assign="register"}<a href="{url page="user" op="register"}">{translate key="about.onlineSubmissions.register"}</a>{/capture}
					<div class="alert alert-primary">
						{translate key="about.onlineSubmissions.registrationRequired" login=$login register=$register}
					</div>
				{/if}

				{if $submissionChecklist}
					<div class="submissions-checklist">
						<h2>
							{translate key="about.submissionPreparationChecklist"}
							{include file="frontend/components/editLink.tpl" page="management" op="settings" path="publication" anchor="submissionStage" sectionTitleKey="about.submissionPreparationChecklist"}
						</h2>
						{translate key="about.submissionPreparationChecklist.description"}
						<ul>
							{foreach from=$submissionChecklist item=checklistItem}
								<li>
									{$checklistItem.content}
								</li>
							{/foreach}
						</ul>
					</div>
				{/if}

				{if $currentContext->getLocalizedSetting('authorGuidelines')}
					<div class="submissions-author-guidelines">
						<h2>
							{translate key="about.authorGuidelines"}
							{include file="frontend/components/editLink.tpl" page="management" op="settings" path="publication" anchor="submissionStage" sectionTitleKey="about.authorGuidelines"}
						</h2>
						{$currentContext->getLocalizedSetting('authorGuidelines')}
					</div>
				{/if}

				{if $currentContext->getLocalizedSetting('copyrightNotice')}
					<div class="submissions-copyright-notice">
						<h2>
							{translate key="about.copyrightNotice"}
							{include file="frontend/components/editLink.tpl" page="management" op="settings" path="distribution" anchor="permissions" sectionTitleKey="about.copyrightNotice"}
						</h2>
						{$currentContext->getLocalizedSetting('copyrightNotice')}
					</div>
				{/if}

				{if $currentContext->getLocalizedSetting('privacyStatement')}
					<div class="submissions-privacy-statement">
						<h2>
							{translate key="about.privacyStatement"}
							{include file="frontend/components/editLink.tpl" page="management" op="settings" path="publication" anchor="submissionStage" sectionTitleKey="about.privacyStatement"}
						</h2>
						{$currentContext->getLocalizedSetting('privacyStatement')}
					</div>
				{/if}
			</div>
		</div>
	</div>
</div>

{include file="frontend/components/footer.tpl"}
