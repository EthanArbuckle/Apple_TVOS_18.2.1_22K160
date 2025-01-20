}

id accessibilityLocalizedString(void *a1)
{
  id v2 = a1;
  v3 = (void *)accessibilityLocalizedString_axBundle;
  if (accessibilityLocalizedString_axBundle
    || (v4 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___AXIdleScreenUIGlue, v1)),  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4),  v6 = (void *)accessibilityLocalizedString_axBundle,  accessibilityLocalizedString_axBundle = v5,  v6,  (v3 = (void *)accessibilityLocalizedString_axBundle) != 0LL))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:v2 value:&stru_41C0 table:@"Accessibility"]);
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

id objc_msgSend_performValidations_withPreValidationHandler_postValidationHandler_safeCategoryInstallationHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:");
}

id objc_msgSend_validateClass_hasClassMethod_withFullSignature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateClass:hasClassMethod:withFullSignature:");
}