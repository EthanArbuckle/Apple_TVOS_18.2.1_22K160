}

id accessibilityLocalizedString(void *a1)
{
  id v1 = a1;
  v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___AXTVKitGlue, v2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v4) {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v1 value:&stru_4198 table:@"Accessibility"]);
  }
  else {
    v6 = 0LL;
  }

  return v6;
}

LABEL_7:
  v17 = v11 / 5.0 * 4.0;
  v18 = llroundf(v17) - 1;
  if (v18 > 3) {
    v19 = @"tv.wifi.strength.very.weak";
  }
  else {
    v19 = *(&off_4138 + v18);
  }
  v20 = accessibilityLocalizedString(v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v20);
LABEL_11:
  v21 = __UIAXStringForVariables(v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  return v22;
}

id objc_msgSend_performValidations_withPreValidationHandler_postValidationHandler_safeCategoryInstallationHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:");
}

id objc_msgSend_validateClass_hasInstanceMethod_withFullSignature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateClass:hasInstanceMethod:withFullSignature:");
}