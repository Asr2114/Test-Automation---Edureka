*** Variables ***
${HOME_BODY}       css=body
${CONTACT_LINK}    xpath=//a[normalize-space()="Contact Us"]
${HOME_LOGO}       xpath=//img[contains(translate(@alt, "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz"), "edureka") or contains(translate(@src, "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz"), "edureka")]
${HOME_IMAGES}     css=body img
${HOME_LINKS}      css=body a[href]