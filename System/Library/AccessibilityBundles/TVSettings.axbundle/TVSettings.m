void sub_4D34( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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
}

id accessibilityLocalizedString(void *a1)
{
  id v1 = a1;
  v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___AXTVGlue, v2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v4) {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v1 value:&stru_8C28 table:@"Accessibility"]);
  }
  else {
    v6 = 0LL;
  }

  return v6;
}

double _tvsettings_accessibilityGetAlphaComponentForColor(void *a1)
{
  id v1 = a1;
  uint64_t v4 = 0x3FF0000000000000LL;
  if (([v1 getWhite:0 alpha:&v4] & 1) == 0
    && ([v1 getHue:0 saturation:0 brightness:0 alpha:&v4] & 1) == 0)
  {
    [v1 getRed:0 green:0 blue:0 alpha:&v4];
  }

  double v2 = *(double *)&v4;

  return v2;
}

id objc_msgSend_performValidations_withPreValidationHandler_postValidationHandler_safeCategoryInstallationHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:");
}

id objc_msgSend_validateClass_isKindOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateClass:isKindOfClass:");
}