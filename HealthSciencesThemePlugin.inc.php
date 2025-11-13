<?php

/**
 * @file plugins/themes/healthSciences/HealthSciencesThemePlugin.inc.php
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class HealthSciencesThemePlugin
 * @ingroup plugins_themes_healthSciences
 *
 * @brief Health Sciences theme
 */

import('lib.pkp.classes.plugins.ThemePlugin');
class HealthSciencesThemePlugin extends ThemePlugin {

	/**
	 * Load the custom styles for our theme
	 * @return null
	 */
	public function init() {

		// Add theme options
		$this->addOption('baseColour', 'colour', array(
			'label' => 'plugins.themes.healthSciences.option.colour.label',
			'description' => 'plugins.themes.healthSciences.option.colour.description',
			'default' => '#10BECA',
		));

		// Update colour based on theme option
		$additionalLessVariables = [];
		$baseColour = $this->getOption('baseColour');
		if (!preg_match('/^#[0-9a-fA-F]{1,6}$/', (string) $baseColour)) $baseColour = '#10BECA'; // pkp/pkp-lib#11974
		if ($baseColour !== '#10BECA') {
			$additionalLessVariables[] = '@primary:' . $baseColour . ';';
			$additionalLessVariables[] = '
				@primary-light: desaturate(lighten(@primary, 41%), 15%);
				@primary-text: darken(@primary, 15%);
				@primary-link: darken(@primary, 50%);
			';
		}

		// Update contrast colour based on primary colour
		if ($this->isColourDark($baseColour)) {
			$additionalLessVariables[] = '
				@contrast: rgba(255, 255, 255, 0.85);
				@primary-text: lighten(@primary, 15%);
				@primary-link: lighten(@primary, 50%);
			';
		}

		$this->addStyle('bootstrap', 'libs/bootstrap.min.css');
		$this->addScript('jquery', 'libs/jquery.min.js');
		$this->addScript('popper', 'libs/popper.min.js');
		$this->addScript('bootstrap', 'libs/bootstrap.min.js');

		// Load theme stylesheet and script
		$this->addStyle('stylesheet', 'styles/index.less');
		$this->modifyStyle('stylesheet', array('addLessVariables' => join("\n", $additionalLessVariables)));
		$this->addScript('main', 'js/main.js');

		// Styles for HTML galleys
		$this->addStyle('htmlFont', 'styles/htmlGalley.less', array('contexts' => 'htmlGalley'));
		$this->addStyle('htmlGalley', 'templates/plugins/generic/htmlArticleGalley/css/default.css', array('contexts' => 'htmlGalley'));

		// Styles for right to left scripts
		$locale = AppLocale::getLocale();
		$localeDirection = AppLocale::getLocaleDirection($locale);
		if ($localeDirection === "rtl") {
			$this->addStyle('rtl', 'styles/rtl.less');
		}

		// Add JQuery UI and tag-it libraries for registration page (reviewer's interests)
		$this->addScript("jquery-ui", "libs/jquery-ui.min.js");
		$this->addScript("tag-it", "libs/tag-it.min.js");

		// Add navigation menu areas for this theme
		$this->addMenuArea(array('primary', 'user'));

		// Get extra data for templates
		HookRegistry::register ('TemplateManager::display', array($this, 'loadTemplateData'));
	}

	/** @see ThemePlugin::saveOption */
	public function saveOption($name, $value, $contextId = null) {
		// Validate the base colour setting value.
		if ($name == 'baseColour' && !preg_match('/^#[0-9a-fA-F]{1,6}$/', $value)) $value = null; // pkp/pkp-lib#11974
		parent::saveOption($name, $value, $contextId);
	}

	/**
	 * Get the display name of this theme
	 * @return string
	 */
	public function getDisplayName() {
			return __('plugins.themes.healthSciences.name');
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	public function getDescription() {
			return __('plugins.themes.healthSciences.description');
	}

	/**
	 * Load custom data for templates
	 *
	 * @param string $hookName
	 * @param array $args [
	 *		@option TemplateManager
	 *		@option string Template file requested
	 *		@option string
	 *		@option string
	 *		@option string output HTML
	 * ]
	 */
	public function loadTemplateData($hookName, $args) {
		$templateMgr = $args[0];
		$request = Application::get()->getRequest();
		$context = $request->getContext();

		if (!defined('SESSION_DISABLE_INIT')) {

			// Get possible locales
			if ($context) {
				$locales = $context->getSupportedLocaleNames();
			} else {
				$locales = $request->getSite()->getSupportedLocaleNames();
			}

			// Load login form
			$loginUrl = $request->url(null, 'login', 'signIn');
			if (Config::getVar('security', 'force_login_ssl')) {
				$loginUrl = PKPString::regexp_replace('/^http:/', 'https:', $loginUrl);
			}

			$orcidImage = $this->getPluginPath() . '/templates/images/orcid.png';

			$templateMgr->assign(array(
				'languageToggleLocales' => $locales,
				'loginUrl' => $loginUrl,
				'brandImage' => 'templates/images/ojs_brand_white.png',
				'orcidImage' => $orcidImage,
			));
		}
	}
}
