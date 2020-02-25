{**
 * templates/frontend/pages/contact.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the press's contact details.
 *
 * @uses $currentContext Journal|Press The current journal or press
 * @uses $mailingAddress string Mailing address for the journal/press
 * @uses $contactName string Primary contact name
 * @uses $contactTitle string Primary contact title
 * @uses $contactAffiliation string Primary contact affiliation
 * @uses $contactPhone string Primary contact phone number
 * @uses $contactEmail string Primary contact email address
 * @uses $supportName string Support contact name
 * @uses $supportPhone string Support contact phone number
 * @uses $supportEmail string Support contact email address
 *}
{include file="frontend/components/header.tpl" pageTitle="about.contact"}

<div class="container page-contact">
	<div class="page-header">
		<h1>{translate key="about.contact"}</h1>
	</div>
	<div class="row justify-content-md-center">
		<div class="col-md-6">
			<div class="page-content">

				{* Contact section *}
				<div class="contact-section">

					{if $mailingAddress}
						<div class="address">
							{$mailingAddress|nl2br|strip_unsafe_html}
						</div>
					{/if}

					{* Primary contact *}
					{if $contactTitle || $contactName || $contactAffiliation || $contactPhone || $contactEmail}
						<div class="contact-primary">
							<h2>
								{translate key="about.contact.principalContact"}
							</h2>

							{if $contactName}
							<div class="contact-name">
								{$contactName|escape}
							</div>
							{/if}

							{if $contactTitle}
							<div class="contact-title">
								{$contactTitle|escape}
							</div>
							{/if}

							{if $contactAffiliation}
							<div class="contact-affiliation">
								{$contactAffiliation|strip_unsafe_html}
							</div>
							{/if}

							{if $contactPhone}
							<div class="contact-phone">
								<span class="label">
									{translate key="about.contact.phone"}
								</span>
								<span class="value">
									{$contactPhone|escape}
								</span>
							</div>
							{/if}

							{if $contactEmail}
							<div class="contact-email">
								<a href="mailto:{$contactEmail|escape}">
									{$contactEmail|escape}
								</a>
							</div>
							{/if}
						</div>
					{/if}

					{* Technical contact *}
					{if $supportName || $supportPhone || $supportEmail}
						<div class="contact-support">
							<h2>
								{translate key="about.contact.supportContact"}
							</h2>

							{if $supportName}
							<div class="contact-name">
								{$supportName|escape}
							</div>
							{/if}

							{if $supportPhone}
							<div class="contact-phone">
								<span class="label">
									{translate key="about.contact.phone"}
								</span>
								<span class="value">
									{$supportPhone|escape}
								</span>
							</div>
							{/if}

							{if $supportEmail}
							<div class="contact-email">
								<a href="mailto:{$supportEmail|escape}">
									{$supportEmail|escape}
								</a>
							</div>
							{/if}
						</div>
					{/if}
				</div>

				<p>
					{include file="frontend/components/editLink.tpl" page="management" op="settings" path="context" anchor="contact" sectionTitleKey="about.contact"}
				</p>
			</div>
		</div>
	</div>
</div>

{include file="frontend/components/footer.tpl"}
