<?php

/**
 * @file plugins/themes/ajlii/AfricanJournalThemePlugin.inc.php
 *
 * Copyright (c) 2014-2025 Simon Fraser University
 * Copyright (c) 2003-2025 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class AfricanJournalThemePlugin
 * @ingroup plugins_themes_ajlii
 *
 * @brief African Journal of Library and Information Innovations Theme
 */

use APP\core\Application;
use PKP\config\Config;
use PKP\facades\Locale;
use PKP\plugins\ThemePlugin;

class AfricanJournalThemePlugin extends ThemePlugin
{
    /**
     * Load the custom styles for our theme
     * @return null
     */
    public function init()
    {

        // Add theme options
        $this->addOption('baseColour', 'colour', [
            'label' => 'plugins.themes.ajlii.option.colour.label',
            'description' => 'plugins.themes.ajlii.option.colour.description',
            'default' => '#38BDF8',
        ]);

        // Add usage stats display options
        $this->addOption('displayStats', 'FieldOptions', [
            'type' => 'radio',
            'label' => __('plugins.themes.ajlii.option.displayStats.label'),
            'options' => [
                [
                    'value' => 'none',
                    'label' => __('plugins.themes.ajlii.option.displayStats.none'),
                ],
                [
                    'value' => 'bar',
                    'label' => __('plugins.themes.ajlii.option.displayStats.bar'),
                ],
                [
                    'value' => 'line',
                    'label' => __('plugins.themes.ajlii.option.displayStats.line'),
                ],
            ],
            'default' => 'none',
        ]);

        $this->addOption('aiProvider', 'FieldOptions', [
            'type' => 'radio',
            'label' => __('plugins.themes.ajlii.option.aiProvider.label'),
            'options' => [
                [
                    'value' => 'openai',
                    'label' => __('plugins.themes.ajlii.option.aiProvider.openai'),
                ],
                [
                    'value' => 'anthropic',
                    'label' => __('plugins.themes.ajlii.option.aiProvider.anthropic'),
                ],
                [
                    'value' => 'custom',
                    'label' => __('plugins.themes.ajlii.option.aiProvider.custom'),
                ],
            ],
            'default' => 'openai',
        ]);

        $this->addOption('aiModel', 'FieldText', [
            'label' => __('plugins.themes.ajlii.option.aiModel.label'),
            'description' => __('plugins.themes.ajlii.option.aiModel.description'),
            'default' => '',
        ]);

        $this->addOption('aiProxyUrl', 'FieldText', [
            'label' => __('plugins.themes.ajlii.option.aiProxyUrl.label'),
            'description' => __('plugins.themes.ajlii.option.aiProxyUrl.description'),
            'default' => '',
        ]);

        $this->addOption('citationMonitorUrl', 'FieldText', [
            'label' => __('plugins.themes.ajlii.option.citationMonitorUrl.label'),
            'description' => __('plugins.themes.ajlii.option.citationMonitorUrl.description'),
            'default' => '',
        ]);

        $this->addOption('orcidRegistrationEnabled', 'FieldOptions', [
            'type' => 'radio',
            'label' => __('plugins.themes.ajlii.option.orcidRegistrationEnabled.label'),
            'options' => [
                [
                    'value' => '1',
                    'label' => __('plugins.themes.ajlii.option.orcidRegistrationEnabled.enabled'),
                ],
                [
                    'value' => '0',
                    'label' => __('plugins.themes.ajlii.option.orcidRegistrationEnabled.disabled'),
                ],
            ],
            'default' => '0',
        ]);

        $this->addOption('orcidApiEnvironment', 'FieldOptions', [
            'type' => 'radio',
            'label' => __('plugins.themes.ajlii.option.orcidApiEnvironment.label'),
            'options' => [
                [
                    'value' => 'production',
                    'label' => __('plugins.themes.ajlii.option.orcidApiEnvironment.production'),
                ],
                [
                    'value' => 'sandbox',
                    'label' => __('plugins.themes.ajlii.option.orcidApiEnvironment.sandbox'),
                ],
            ],
            'default' => 'production',
        ]);

        $this->addOption('orcidClientId', 'FieldText', [
            'label' => __('plugins.themes.ajlii.option.orcidClientId.label'),
            'description' => __('plugins.themes.ajlii.option.orcidClientId.description'),
            'default' => '',
        ]);

        $this->addOption('orcidRedirectUri', 'FieldText', [
            'label' => __('plugins.themes.ajlii.option.orcidRedirectUri.label'),
            'description' => __('plugins.themes.ajlii.option.orcidRedirectUri.description'),
            'default' => '',
        ]);

        $this->addOption('orcidScope', 'FieldText', [
            'label' => __('plugins.themes.ajlii.option.orcidScope.label'),
            'description' => __('plugins.themes.ajlii.option.orcidScope.description'),
            'default' => '/authenticate',
        ]);

        $this->addOption('heroSliderEnabled', 'FieldOptions', [
            'type' => 'radio',
            'label' => __('plugins.themes.ajlii.option.heroSliderEnabled.label'),
            'options' => [
                [
                    'value' => '1',
                    'label' => __('plugins.themes.ajlii.option.heroSliderEnabled.enabled'),
                ],
                [
                    'value' => '0',
                    'label' => __('plugins.themes.ajlii.option.heroSliderEnabled.disabled'),
                ],
            ],
            'default' => '1',
        ]);

        $this->addOption('heroSliderAutoplay', 'FieldOptions', [
            'type' => 'radio',
            'label' => __('plugins.themes.ajlii.option.heroSliderAutoplay.label'),
            'options' => [
                [
                    'value' => '1',
                    'label' => __('plugins.themes.ajlii.option.heroSliderAutoplay.enabled'),
                ],
                [
                    'value' => '0',
                    'label' => __('plugins.themes.ajlii.option.heroSliderAutoplay.disabled'),
                ],
            ],
            'default' => '1',
        ]);

        for ($slideIndex = 1; $slideIndex <= 5; $slideIndex++) {
            foreach ([
                'ImageUrl' => __('plugins.themes.ajlii.option.heroSlideImageUrl.description'),
                'Title' => __('plugins.themes.ajlii.option.heroSlideTitle.description'),
                'Description' => __('plugins.themes.ajlii.option.heroSlideDescription.description'),
                'Url' => __('plugins.themes.ajlii.option.heroSlideUrl.description'),
                'Label' => __('plugins.themes.ajlii.option.heroSlideLabel.description'),
            ] as $fieldName => $description) {
                $this->addOption('heroSlide' . $slideIndex . $fieldName, 'FieldText', [
                    'label' => __('plugins.themes.ajlii.option.heroSlide.label', ['number' => $slideIndex]) . ' ' . __('plugins.themes.ajlii.option.heroSlide' . $fieldName . '.label'),
                    'description' => $description,
                    'default' => '',
                ]);
            }
        }

        foreach ([
            'authorityWebsiteUrl',
            'authorityOrcidUrl',
            'authorityDoajUrl',
            'authorityCrossrefUrl',
            'authorityGoogleScholarUrl',
            'authorityLinkedInUrl',
            'authorityYouTubeUrl',
            'authorityRepositoryUrl',
        ] as $authorityUrlOption) {
            $this->addOption($authorityUrlOption, 'FieldText', [
                'label' => __('plugins.themes.ajlii.option.' . $authorityUrlOption . '.label'),
                'description' => __('plugins.themes.ajlii.option.authorityUrl.description'),
                'default' => '',
            ]);
        }

        // Update colour based on theme option
        $additionalLessVariables = [];
        $baseColour = $this->getOption('baseColour');
        if (!preg_match('/^#[0-9a-fA-F]{1,6}$/', (string) $baseColour)) $baseColour = '#38BDF8'; // pkp/pkp-lib#11974
        if ($baseColour !== '#38BDF8') {
            $additionalLessVariables[] = '@primary:' . $baseColour . ';';
            $additionalLessVariables[] = '
				@primary-light: desaturate(lighten(@primary, 41%), 15%);
				@primary-text: darken(@primary, 15%);
				@primary-link: darken(@primary, 50%);
			';
        }

        // Update contrast colour based on primary colour
        $checkMarkColour = 'FFF';
        if ($this->isColourDark($baseColour)) {
            $checkMarkColour = 'FFF';
            $additionalLessVariables[] = '
				@contrast: rgba(255, 255, 255, 0.95);
				@primary-text: lighten(@primary, 15%);
				@primary-link: lighten(@primary, 50%);
				@btn-border-colour: @primary;
			';
        }

        /**
         * Change the check mark image colour for better contrast,
         * the URL is from bootstrap5/scss/_variables.scss => $form-check-input-checked-bg-image
         */
        $checkImageUrl = 'data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"> ' .
            '<path fill="none" stroke="#' . $checkMarkColour . '" stroke-linecap="round" stroke-linejoin="round" ' .
            'stroke-width="3" d="M6 10l3 3l6-6"/></svg>';

        $additionalLessVariables[] = '
			@check-image-url: url(\'' . str_replace(['<', '>', '#'], ['%3c', '%3e', '%23'], $checkImageUrl) . '\');
		';

        $this->addScript('app-js', 'libs/app.min.js');
        $this->addScript('production-js', 'libs/ajlii-production.js');

        // Load static production stylesheets and script.
        $this->addStyle('app-css', 'libs/app.min.css');
        $this->addStyle('production-css', 'styles/ajlii-production.css');

        // Styles for HTML galleys
        $this->addStyle('htmlFont', 'styles/htmlGalley.less', ['contexts' => 'htmlGalley']);
        $this->addStyle('htmlGalley', 'templates/plugins/generic/htmlArticleGalley/css/default.css', ['contexts' => 'htmlGalley']);

        // Styles for right to left scripts
        $locale = Locale::getLocale();
        if (Locale::getMetadata($locale)->isRightToLeft()) {
            $this->addStyle('rtl', 'styles/rtl.less');
        }

        // Add navigation menu areas for this theme
        $this->addMenuArea(['primary', 'user']);

        // Get extra data for templates
        HookRegistry::add('TemplateManager::display', [$this, 'loadTemplateData']);
    }

    /** @see ThemePlugin::saveOption */
    public function saveOption($name, $value, $contextId = null) {
        // Validate the base colour setting value.
        if ($name == 'baseColour' && !preg_match('/^#[0-9a-fA-F]{1,6}$/', $value)) $value = null; // pkp/pkp-lib#11974
        if (($name == 'aiProxyUrl' || $name == 'citationMonitorUrl' || $name == 'orcidRedirectUri' || preg_match('/^authority.*Url$/', $name)) && $value && !preg_match('/^https?:\/\//i', $value)) $value = null;
        if (preg_match('/^heroSlide\d+(ImageUrl|Url)$/', $name) && $value && !preg_match('/^(https?:\/\/|\/)[^\s"\'<>]+$/i', $value)) $value = null;
        if ($name == 'orcidClientId' && $value && !preg_match('/^[A-Za-z0-9._:-]+$/', $value)) $value = null;
        if ($name == 'orcidScope' && $value && !preg_match('/^[A-Za-z0-9_\/ .:-]+$/', $value)) $value = '/authenticate';
        parent::saveOption($name, $value, $contextId);
    }

    /**
     * Get the display name of this theme
     */
    public function getDisplayName(): string
    {
        return __('plugins.themes.ajlii.name');
    }

    /**
     * Get the description of this plugin
     */
    public function getDescription(): string
    {
        return __('plugins.themes.ajlii.description');
    }

    /**
     * Load custom data for templates
     *
     * @param string $hookName
     * @param array $args [
     *      @option TemplateManager
     *      @option string Template file requested
     *      @option string
     *      @option string
     *      @option string output HTML
     * ]
     */
    public function loadTemplateData($hookName, $args)
    {
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
                $loginUrl = preg_replace('/^http:/u', 'https:', $loginUrl);
            }

            $authorityLinks = [];
            foreach ([
                'authorityWebsiteUrl' => __('plugins.themes.ajlii.authority.website'),
                'authorityOrcidUrl' => __('plugins.themes.ajlii.authority.orcid'),
                'authorityDoajUrl' => __('plugins.themes.ajlii.authority.doaj'),
                'authorityCrossrefUrl' => __('plugins.themes.ajlii.authority.crossref'),
                'authorityGoogleScholarUrl' => __('plugins.themes.ajlii.authority.googleScholar'),
                'authorityLinkedInUrl' => __('plugins.themes.ajlii.authority.linkedIn'),
                'authorityYouTubeUrl' => __('plugins.themes.ajlii.authority.youtube'),
                'authorityRepositoryUrl' => __('plugins.themes.ajlii.authority.repository'),
            ] as $optionName => $label) {
                $url = $this->getOption($optionName);
                if ($url) {
                    $authorityLinks[] = [
                        'label' => $label,
                        'url' => $url,
                    ];
                }
            }

            $templateMgr->assign([
                'languageToggleLocales' => $locales,
                'loginUrl' => $loginUrl,
                'brandImage' => 'templates/images/ojs_brand_white.png',
                'ajliiHomepageSliderEnabled' => $this->getOption('heroSliderEnabled') !== '0',
                'ajliiHomepageSliderAutoplay' => $this->getOption('heroSliderAutoplay') !== '0',
                'ajliiHomepageSliderSlides' => $this->getHeroSliderSlides(),
                'ajliiAiProvider' => $this->getOption('aiProvider') ?: 'openai',
                'ajliiAiModel' => $this->getOption('aiModel') ?: '',
                'ajliiAiProxyUrl' => $this->getOption('aiProxyUrl') ?: '',
                'ajliiCitationMonitorUrl' => $this->getOption('citationMonitorUrl') ?: '',
                'ajliiOrcidRegistrationEnabled' => $this->getOption('orcidRegistrationEnabled') === '1',
                'ajliiOrcidAuthUrl' => $this->getOrcidAuthorizeUrl($request),
                'ajliiOrcidAboutUrl' => $request->url(null, 'orcidapi', 'about'),
                'ajliiAuthorityLinks' => $authorityLinks,
            ]);
        }
    }

    private function getOrcidAuthorizeUrl($request): string
    {
        if ($this->getOption('orcidRegistrationEnabled') !== '1') {
            return '';
        }

        $clientId = trim((string) $this->getOption('orcidClientId'));
        if (!$clientId) {
            return '';
        }

        $environment = $this->getOption('orcidApiEnvironment') === 'sandbox' ? 'sandbox' : 'production';
        $baseUrl = $environment === 'sandbox' ? 'https://sandbox.orcid.org/oauth/authorize' : 'https://orcid.org/oauth/authorize';
        $redirectUri = trim((string) $this->getOption('orcidRedirectUri')) ?: $request->url(null, 'orcidapi', 'orcidAuthorize');
        $scope = trim((string) $this->getOption('orcidScope')) ?: '/authenticate';

        return $baseUrl . '?' . http_build_query([
            'client_id' => $clientId,
            'response_type' => 'code',
            'scope' => $scope,
            'redirect_uri' => $redirectUri,
        ], '', '&', PHP_QUERY_RFC3986);
    }

    private function getHeroSliderSlides(): array
    {
        $slides = [];
        for ($slideIndex = 1; $slideIndex <= 5; $slideIndex++) {
            $title = trim((string) $this->getOption('heroSlide' . $slideIndex . 'Title'));
            $imageUrl = trim((string) $this->getOption('heroSlide' . $slideIndex . 'ImageUrl'));
            $description = trim((string) $this->getOption('heroSlide' . $slideIndex . 'Description'));
            $url = trim((string) $this->getOption('heroSlide' . $slideIndex . 'Url'));
            $label = trim((string) $this->getOption('heroSlide' . $slideIndex . 'Label'));

            if (!$title && !$imageUrl && !$description) {
                continue;
            }

            $slides[] = [
                'title' => $title,
                'imageUrl' => $imageUrl,
                'description' => $description,
                'url' => $url,
                'label' => $label ?: __('plugins.themes.ajlii.slider.readMore'),
                'type' => __('plugins.themes.ajlii.slider.managed'),
            ];
        }

        return $slides;
    }

}
