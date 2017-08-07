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
          $this->addStyle('stylesheet', 'styles/index.less');
      }

      /**
       * Get the display name of this theme
       * @return string
       */
      function getDisplayName() {
          return 'Health Sciences Theme';
      }

      /**
       * Get the description of this plugin
       * @return string
       */
      function getDescription() {
          return 'An OJS theme built with a focus on health sciences journals.';
      }
  }
