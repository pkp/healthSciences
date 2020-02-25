{**
 * templates/subscriptions/userInstitutionalSubscriptionForm.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User purchase institutional subscription form
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.subscriptions.purchaseInstitutionalSubscription"}

<div class="container page-institutional-subscription">
	<div class="row page-header justify-content-md-center">
		<div class="col-md-8">
			<h1>{translate key="user.subscriptions.purchaseInstitutionalSubscription"}</h1>
		</div>
	</div>

	<div class="row justify-content-md-center">
		<div class="col-md-8">
			<div class="page-content">

				{assign var="formPath" value="institutional"}
				{if $subscriptionId}
					{assign var="formPath" value="institutional"|to_array:$subscriptionId}
				{/if}
				<form class="purchase-subscription" method="post" id="subscriptionForm" action="{url op="payPurchaseSubscription" path=$formPath}">
					{csrf}

					{include file="common/formErrors.tpl"}

					<div class="form-group">
						<label for="subscription-type">
							{translate key="user.subscriptions.form.typeId"}
						</label>
						<select name="typeId" id="typeId" class="form-control" required>
							{foreach name=types from=$subscriptionTypes item=subscriptionType}
								<option value="{$subscriptionType->getId()}"{if $typeId == $subscriptionType->getId()} selected{/if}>{$subscriptionType->getLocalizedName()|escape}</option>
							{/foreach}
						</select>
					</div>

					<div class="form-group">
						<label for="subscription-membership">
							{translate key="user.subscriptions.form.membership"}
						</label>
						<input type="text" name="membership" class="form-control" id="membership" value="{$membership|escape}" aria-describedby="subscriptionMembershipDescription">
						<small class="form-text text-muted" id="subscriptionMembershipDescription">{translate key="user.subscriptions.form.membershipInstructions"}</small>
					</div>

					<div class="form-group">
						<label for="subscription-institution">
							{translate key="user.subscriptions.form.institutionName"}
						</label>
						<input type="text" name="institutionName" class="form-control" id="institutionName" value="{$institutionName|escape}">
					</div>

					<div class="form-group">
						<label for="subscription-address">
							{translate key="user.subscriptions.form.institutionMailingAddress"}
						</label>
						<textarea name="institutionMailingAddress" class="form-control" id="institutionMailingAddress">{$institutionMailingAddress|escape}</textarea>
					</div>

					<div class="form-group">
						<label for="subscription-membership">
							{translate key="user.subscriptions.form.domain"}
						</label>
						<input type="text" name="domain" class="form-control" id="domain" value="{$domain|escape}" aria-describedby="subscriptionDomainDescription">
						<small class="form-text text-muted" id="subscriptionDomainDescription">{translate key="user.subscriptions.form.domainInstructions"}</small>
					</div>

					<div class="form-group">
						<label for="subscription-ips">
							{translate key="user.subscriptions.form.ipRange"}
						</label>
						<input type="text" name="ipRanges" class="form-control" id="ipRanges" value="{$ipRanges|escape}" aria-describedby="subscriptionIPDescription">
						<small class="form-text text-muted" id="subscriptionIPDescription">{translate key="user.subscriptions.form.ipRangeInstructions"}</small>
					</div>

					<div class="buttons">
						<button class="btn btn-default" type="submit">
							{translate key="common.continue"}
						</button>
						<a class="btn btn-link" href="{url page="user" op="subscriptions"}">
							{translate key="common.cancel"}
						</a>
					</div>

				</form>
			</div>
		</div>
	</div>
</div>

{include file="frontend/components/footer.tpl"}
