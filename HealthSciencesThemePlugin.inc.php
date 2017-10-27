<?php

/**
 * @file plugins/themes/ojs-health-sciences/HealthSciencesThemePlugin.inc.php
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class HealthSciencesThemePlugin
 * @ingroup plugins_themes_ojs-health-sciences
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

          // Load fonts
          $this->addStyle(
            'fonts',
            'https://fonts.googleapis.com/css?family=Droid+Serif:200,200i,400,400i|Fira+Sans:300,300i,400,400i,700,700i',
            array('baseUrl' => '')
          );

          // Load main stylesheet
          $this->addStyle('stylesheet', 'styles/index.less');

          // Load JS libraries
          $this->addScript(
            'jquery',
            'https://code.jquery.com/jquery-3.2.1.slim.min.js',
            array('baseUrl' => '')
          );
          $this->addScript(
            'popper',
            'https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js',
            array('baseUrl' => '')
          );
          $this->addScript(
            'bootstrap',
            'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js',
            array('baseUrl' => '')
          );

          // Add navigation menu areas for this theme
      		$this->addMenuArea(array('primary', 'user'));
      }

      /**
       * Get the display name of this theme
       * @return string
       */
      function getDisplayName() {
          return __('plugins.themes.ojsHealthSciences.name');
      }

      /**
       * Get the description of this plugin
       * @return string
       */
      function getDescription() {
          return __('plugins.themes.ojsHealthSciences.description');
      }
  }
