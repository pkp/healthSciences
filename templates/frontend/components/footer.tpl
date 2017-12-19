{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *}
<footer class="site-footer">
	<div class="container site-footer-sidebar" role="complementary" aria-label="{translate|escape key="common.navigation.sidebar"}">
			{call_hook name="Templates::Common::Sidebar"}
		</div>
	</div>
	<div class="container site-footer-content">
		<div class="row">
			{if $pageFooter}
				<div class="col-md site-footer-content align-self-center">
					{$pageFooter}
				</div>
			{/if}

			<div class="col-md col-md-2 align-self-center text-right">
				<a href="{url page="about" op="aboutThisPublishingSystem"}">
					<img class="footer-brand-image" alt="{translate key="about.aboutThisPublishingSystem"}" src="{$baseUrl}/{$brandImage}">
				</a>
			</div>
		</div>
	</div>
</footer><!-- pkp_structure_footer_wrapper -->

{load_script context="frontend" scripts=$scripts}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
