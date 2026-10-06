*** Variables ***
${CONTACT_FORM}          id=contactform
${CONTACT_NAME}          id=first_name
${CONTACT_PHONE_INPUT}   id=mobile
${CONTACT_EMAIL}         id=email
${CONTACT_QUERY}         id=query
${CONTACT_SUBMIT}        xpath=//form[@id="contactform"]//button[normalize-space()="Send Message"]
${CONTACT_ERRORS}        css=#contactform .all_error_handler:not(.hide)
${CONTACT_SUCCESS}       css=#contactform .success, #contactform .alert-success, #contactform .success_msg