}

id accessibilityLocalizedString(void *a1)
{
  id v2 = a1;
  v3 = (void *)accessibilityLocalizedString_axBundle;
  if (accessibilityLocalizedString_axBundle
    || (v4 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___AXTVSystemUIServiceGlue, v1)),  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4),  v6 = (void *)accessibilityLocalizedString_axBundle,  accessibilityLocalizedString_axBundle = v5,  v6,  (v3 = (void *)accessibilityLocalizedString_axBundle) != 0LL))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:v2 value:&stru_86D8 table:@"Accessibility"]);
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

void sub_50B4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_587C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id objc_msgSend_performValidations_withPreValidationHandler_postValidationHandler_safeCategoryInstallationHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:");
}

id objc_msgSend_validateClass_hasInstanceVariable_withType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateClass:hasInstanceVariable:withType:");
}