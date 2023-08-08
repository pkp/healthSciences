{if $citation}
	<div class="article-details-block article-details-how-to-cite">
		<h2 class="article-details-heading">
            {translate key="submission.howToCite"}
		</h2>
		<div id="citationOutput" class="article-details-how-to-cite-citation" role="region" aria-live="polite">
            {$citation}
		</div>
		<div class="dropdown">
			<button class="btn dropdown-toggle" type="button" id="cslCitationFormatsButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-csl-dropdown="true">
                {translate key="submission.howToCite.citationFormats"}
			</button>
			<div class="dropdown-menu" aria-labelledby="cslCitationFormatsButton">
                {foreach from=$citationStyles item="citationStyle"}
					<a
							class="dropdown-item"
							aria-controls="citationOutput"
							href="{url page="citationstylelanguage" op="get" path=$citationStyle.id params=$citationArgs}"
							data-load-citation
							data-json-href="{url page="citationstylelanguage" op="get" path=$citationStyle.id params=$citationArgsJson}"
					>
                        {$citationStyle.title|escape}
					</a>
                {/foreach}
                {if count($citationDownloads)}
					<h3 class="dropdown-header">
                        {translate key="submission.howToCite.downloadCitation"}
					</h3>
                    {foreach from=$citationDownloads item="citationDownload"}
						<a class="dropdown-item" href="{url page="citationstylelanguage" op="download" path=$citationDownload.id params=$citationArgs}">
                            {$citationDownload.title|escape}
						</a>
                    {/foreach}
                {/if}
			</div>
		</div>
	</div>
{/if}