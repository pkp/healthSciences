# Health Sciences Theme

An official theme for [OJS 3.1.1+](https://pkp.sfu.ca/ojs/) designed for health science journals or any journal that wants a clean, modern appearance.

Current version: Beta (unreleased)

This theme was commissioned and is maintained by the [Public Knowledge Project](https://pkp.sfu.ca/). For all non-technical questions, please visit the [PKP Forum](https://forum.pkp.sfu.ca/).

## Installation

You can install the latest stable release by going to the **Settings > Websites > Plugins > Plugin Gallery** page in your Open Journal Systems website.

If you'd like to use unreleased packages, you can clone this repository or follow these steps:

1. Download the [latest release](https://github.com/pkp/healthSciences/releases).
2. Unpack the .tar.gz file and move the `healthSciences` directory to your OJS installation at `/plugins/themes/healthSciences`.
3. Login to the admin area of your OJS website. Browse to the Settings > Website > Plugins page and enable the Health Sciences theme.
4. Browse to the Settings > Website > Appearance page and select Health Sciences from the theme option and save your change.

## Version Compatibility

The beta version is only compatible with the latest `master` branch of OJS, and is expected to be released alongside 3.1.1.

## Contribution

This theme was designed by Sophy Ouch (@sssoz) and built by Nate Wright (@NateWr) using [Bootstrap4](https://getbootstrap.com/).

## Changelog

**Beta** (2018-02-13)
* Fix: Plugin can't be installed through plugin upload tool (#2)
* Fix: Issue description box appears when no description exists (#3)
* Fix: Language selector appears when no other languages exist (#4)
* Fix: Login form in modal doesn't work (#6, #7)
* Add: HTML/PDF galley views (#1)

**Alpha1** (2018-01-18)
* Initial release for testing
