{**
 * plugins/paymethod/manual/templates/paymentForm.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Manual payment page
 *}
{include file="frontend/components/header.tpl" pageTitle="plugins.paymethod.manual"}

<div class="container page-institutional-subscription">
	<div class="page-header">
		<h1>{translate key="plugins.paymethod.manual"}</h1>
	</div>

	<div class="row justify-content-md-center">
		<div class="col-md-8">
			<div class="page-content">
				<table class="table">
					<tr>
						<th>{translate key="plugins.paymethod.manual.purchase.title"}</th>
						<td>{$itemName|escape}</td>
					</tr>
					{if $itemAmount}
						<tr>
							<th>{translate key="plugins.paymethod.manual.purchase.fee"}</th>
							<td>{$itemAmount|string_format:"%.2f"}{if $itemCurrencyCode} ({$itemCurrencyCode|escape}){/if}</td>
						</tr>
					{/if}
				</table>

				<p>{$manualInstructions|nl2br}</p>

				<p>
					<a class="btn" href="{url page="payment" op="plugin" path="ManualPayment"|to_array:"notify":$queuedPaymentId|escape}" class="action">
						{translate key="plugins.paymethod.manual.sendNotificationOfPayment"}
					</a>
				</p>
			</div>
		</div>
	</div>
</div>

{include file="frontend/components/footer.tpl"}
