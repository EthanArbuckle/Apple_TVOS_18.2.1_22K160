}

id accessibilityLocalizedString(void *a1)
{
  id v1 = a1;
  v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___AXTVSystemMenuServiceGlue, v2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v4) {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v1 value:&stru_4388 table:@"Accessibility"]);
  }
  else {
    v6 = 0LL;
  }

  return v6;
}

void sub_2CE0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id objc_msgSend_performValidations_withPreValidationHandler_postValidationHandler_safeCategoryInstallationHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}