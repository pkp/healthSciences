{**
 * templates/frontend/components/subscriptionContact.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the contact details for a journal's subscriptions
 *
 * @uses $subscriptionAdditionalInformation string HTML text description
 *       subcription information
 * @uses $subscriptionMailingAddress string Contact address for subscriptions
 * @uses $subscriptionName string Contact name for subscriptions
 * @uses $subscriptionPhone string Contact phone number for subscriptions
 * @uses $subscriptionEmail string Contact email address for subscriptions
 *}
 <div class="subscription-contact">
	 {if $subscriptionAdditionalInformation}
		<div class="subscription-description">
			{$subscriptionAdditionalInformation|strip_unsafe_html}
		</div>
	{/if}

	{if $subscriptionName || $subscriptionPhone || $subscriptionEmail}
		<div class="subscription-contact">
			<h2>
				{translate key="about.subscriptionsContact"}
			</h2>

			{if $subscriptionName}
				<div class="subscription-name">
					{$subscriptionName|escape}
				</div>
			{/if}

			{if $subscriptionMailingAddress}
				<div class="subscription-address">
					{$subscriptionMailingAddress|nl2br|strip_unsafe_html}
				</div>
			{/if}

			{if $subscriptionPhone}
				<div class="subscription-phone">
					<span class="label">
						{translate key="about.contact.phone"}
					</span>
					<span class="value">
						{$subscriptionPhone|escape}
					</span>
				</div>
			{/if}

			{if $subscriptionEmail}
				<div class="subscription-email">
					<a href="mailto:{$subscriptionEmail|escape}">
						{$subscriptionEmail|escape}
					</a>
				</div>
			{/if}
		</div>
	{/if}
 </div>
