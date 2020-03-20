# Health Sciences Theme

An official theme for [OJS 3.1.1+](https://pkp.sfu.ca/ojs/) designed for health science journals or any journal that wants a clean, modern appearance.

Current version: healthSciences v1.0.6-1

This theme was commissioned and is maintained by the [Public Knowledge Project](https://pkp.sfu.ca/). For all non-technical questions, please visit the [PKP Forum](https://forum.pkp.sfu.ca/). 

## Demonstration 

You can see a demonstration of this theme on the [PKP website](https://demo.publicknowledgeproject.org/ojs3/demo/index.php/health-sciences).

## Installation

You can install the latest stable release by going to the `Settings` > `Websites` > `Plugins` > `Plugin Gallery` page in your Open Journal Systems website.

If you'd like to use unreleased packages, you can clone this repository or follow these steps:

1. Download the [latest release](https://github.com/pkp/healthSciences/releases).
2. Unpack the .tar.gz file and move the `healthSciences` directory to your OJS installation at `/plugins/themes/healthSciences`.
3. Login to the admin area of your OJS website. Browse to the `Settings` > `Website` > `Plugins` page and enable the Health Sciences theme.
4. Browse to the `Settings` > `Website` > `Appearance` page and select Health Sciences from the theme option and save your change.

## Settings 

**Theme Colour** | This theme allows the personalisation of the theme’s main colour. The default colour is a bright turquoise. If you wish to select your own palette (in `Settings` >  `Website`), and for optimal results, we recommend selecting bold and vivid tones.

**Navigation Menu** | For the best user experience, we recommend limiting the number of items in your navigation menus. Research shows that users struggle to find what they are looking for in long lists.

**Logo Image** | This is the image that contains the journal title. Simply using text is also an option here. Logo images should be:

- JPG for photographs or PNG for design marks;
- of a larger width than height;
- transparent background.

**Home Page Image** | This is the large operating room image seen in the demonstration linked above:

- should be 2000 x 1000 px in dimension;
- should be a very high-quality photo with no stretching;
- light text will be displayed on top of this image, so it should be dark enough to read text on top of the image. It is usually better to avoid images with high contrast (very light and very dark areas) since text may be visible on any part of the image.

**Home Page Additional Content** | Adding content here can often disrupt the clean design of this theme. Ask yourself if this content would be better placed in a custom page with a link from the primary navigation menu instead.

**Page Footer** | We recommend keeping the Page Footer short, limited to your journal identification details, such as journal title and mailing address, as well as any required copyright or affiliation statements.

**Issue Cover Image** | Issue cover images should be:

- JPG for photographs or PNG for illustrations without photographs;
- size: 210x315 pixels;
- of a larger height than width;
- used consistently - either give all issues an image or none.

**Article cover images** should be:

- JPG for photographs or PNG for illustrations without photographs;
- size: 210x315 pixels;
- used consistently - either give all articles an image or none.

**Custom Blocks** | This theme places custom blocks in the footer. We recommend minimizing the use of custom blocks to present a cleaner, more professional look. Wherever possible, consider placing what might have gone into a custom block into a custom page, and link to it from the primary navigation menu.

**Journal Thumbnail** | Journal thumbnail images will only appear on a multi-journal OJS installation, on the list of all journals on the site. The image should be:

- JPG for photographs or PNG for illustrations without photographs;
- of a larger width than height;
- 160px x 320px pixels in dimension.

**Galleys** | If there isn’t any CSS file attached to the HTML galley, the default theme’s style will be used

## Version Compatibility

* Health Sciences theme v1.0.0 is compatible with OJS 3.1.1.
* Health Sciences theme v1.0.1 is compatible with OJS 3.1.1-1.
* Health Sciences theme v1.0.2 is compatible with OJS 3.1.1-2.
* Health Sciences theme v1.0.3 is compatible with OJS 3.1.1-4.
* Health Sciences theme v1.0.4 is compatible with OJS 3.1.2.
* Health Sciences theme v1.0.5 is compatible with OJS 3.1.2-1.
* Health Sciences theme v1.0.6 is compatible with OJS 3.2.0.
* Health Sciences theme v1.0.6-1 is compatible with OJS 3.2.0.

## Contribution

This theme was designed by Sophy Ouch (@sssoz) and built by Nate Wright (@NateWr) and Vitalii Bezsheiko (@Vitaliy-1) using [Bootstrap4](https://getbootstrap.com/).

## Contributions

We welcome code contributions from the community at https://github.com/pkp/healthSciences/. Non-technical questions should be directed to the community forum at https://forum.pkp.sfu.ca/.

## Feedback
Suggestions for improving this guide can be made to support@publicknowledgeproject.org. 

## License
This theme is released under the GPL license. 

## Changelog
**healthSciences v1.0.6-1** (2020-03-20)
* Add: New localizations (pl_PL) and (it_IT); special thanks to contributors!
* Fix: View HTML and PDF galleys of article's old versions
* Fix: Escape raw citations on article page
* Fix: Retain reviewer interests data from the registration form 

**healthSciences v1.0.6** (2020-02-27)
* Compatibility with OJS 3.2

**healthSciences v1.0.5** (2019-11-15)
* Add: New localizations (fr_FR); special thanks to contributors!
* Add: Announcements are added for the journal landing page
* Add: Better contrast for colors
* Fix: HTML galley scrolling for iOS devices
* Fix: Show copyright holder on article lading page
* Fix: Various minor styling changes
* Fix: Enhance the check if journal list is empty (site index page)

**healthSciences v1.0.4**  (2019-03-05)
* Add: New localizations (fr_CA); special thanks to contributors!
* Add: Compliance with Smarty 3
* Add: Update for the default HTML galley styling
* Add: Update for the registration form to be compliant with OJS 3.1.2
* Add: Support for the catalog category page
* Add: Dependencies update: Bootstrap to v. 4.3.1 and Popper JS to 1.14.7
* Fix: Changed alignment for the issue TOC and issue description
* Fix: Security issues

**healthSciences v1.0.3**  (2018-12-31)
* Add: New localizations (es_ES, cs_CZ, nb_NO, ar_IQ, uk_UA, pt_BR) and updates; special thanks to contributors!
* Add: Alternative text for the journal thumbnail (#109)
* Add: Updates for site-wide registration page (#110)
* Add: Dependencies update: Fontawesome to v. 5.6.1
* Add: Support for right to left scripts (#122)
* Fix: Removing redundant code from PDF JS viewer's template (#111)
* Fix: Modals with authors Biography are now working correctly (#115)
* Fix: Issue links on the archive page are clickable in all possible cases of user inputs to issue form (#120) 
* Fix: Security issues

**healthSciences v1.0.2**  (2018-07-30)
* Add: Styling for authors' list on article landing page (#76)
* Add: Support for pages related to the subscription, authors' search, and several others (#80)
* Add: Orcid image is shown if author has ORCID ID on article landing page (#73)
* Add: Reordering of blocks on article landing page for mobiles according to their priorities (#74)
* Add: Journal description is shown if no issue description is provided (#75)
* Add: Dependencies update: JQuery, Popper, Bootstrap, Fontawesome (#97)
* Add: DOI is shown for each article on issue TOC page if provided (#94)
* Fix: Proper page header aligning for small screens (#87)
* Fix: Unique ID for modal login forms
* Fix: Minor theme-wide restyling 

**healthSciences v1.0.1**  (2018-06-18)
* Add: Support for OJS 3.1.1-1
* Add: Support for reviewer interests input
* Fix: Styling adjustments for article landing page

**healthSciences v1.0.0**  (2018-04-24)
* Fix: Remove bullet points from feed block plugins
* Fix: Implement information for X pages
* Fix: Site-wide font-size modifications

**Beta** (2018-02-13)
* Fix: Plugin can't be installed through plugin upload tool (#2)
* Fix: Issue description box appears when no description exists (#3)
* Fix: Language selector appears when no other languages exist (#4)
* Fix: Login form in modal doesn't work (#6, #7)
* Add: HTML/PDF galley views (#1)

**Alpha1** (2018-01-18)
* Initial release for testing
