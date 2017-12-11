<?php

/**
 * @file plugins/themes/healthSciences/HealthSciencesThemePlugin.inc.php
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
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
		if ($this->getOption('baseColour') !== '#10BECA') {
			$additionalLessVariables[] = '@primary:' . $this->getOption('baseColour') . ';';
			if (!$this->isColourDark($this->getOption('baseColour'))) {
				$additionalLessVariables[] = '@primary-light: desaturate(lighten(@primary, 41%), 15%);';
				$additionalLessVariables[] = '@primary-text: darken(@primary, 15%);';
			}
		}

		// Load dependencies from CDN
		if (Config::getVar('general', 'enable_cdn')) {
			$this->addStyle(
				'fonts',
				'https://fonts.googleapis.com/css?family=Droid+Serif:200,200i,400,400i|Fira+Sans:300,300i,400,400i,700,700i',
				array('baseUrl' => '')
			);
			$this->addStyle(
				'bootstrap',
				'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css',
				array('baseUrl' => '')
			);
			$this->addScript(
				'jquery',
				'https://code.jquery.com/jquery-3.2.1.slim.min.js',
				array('baseUrl' => '')
			);
			$this->addScript(
				'popper',
				'https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js',
				array('baseUrl' => '')
			);
			$this->addScript(
				'bootstrap',
				'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js',
				array('baseUrl' => '')
			);

		// Load local copies of dependencies if CDNs are not allowed
		} else {
			$this->addStyle('bootstrap', 'lib/bootstrap.min.css');
			$this->addScript('jquery', 'lib/jquery-3.2.1.slim.min.js');
			$this->addScript('popper', 'lib/popper.min.js');
			$this->addScript('bootstrap', 'lib/bootstrap.min.js');
		}

		// Load theme stylesheet
		$this->addStyle('stylesheet', 'styles/index.less');
		$this->modifyStyle('stylesheet', array('addLessVariables' => join($additionalLessVariables)));

		// Add navigation menu areas for this theme
		$this->addMenuArea(array('primary', 'user'));
	}

	/**
	 * Get the display name of this theme
	 * @return string
	 */
	function getDisplayName() {
			return __('plugins.themes.healthSciences.name');
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription() {
			return __('plugins.themes.healthSciences.description');
	}
}
