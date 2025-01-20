void sub_4594( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_4C44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
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
}

id accessibilityLocalizedString(void *a1)
{
  id v1 = a1;
  v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___AXTVPhotosGlue, v2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v4) {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v1 value:&stru_89D0 table:@"Accessibility"]);
  }
  else {
    v6 = 0LL;
  }

  return v6;
}

__CFString *accessibilityLocalizedStringForAssetType(uint64_t a1)
{
  uint64_t v1 = a1 - 2;
  if ((unint64_t)(a1 - 2) <= 6 && ((0x71u >> v1) & 1) != 0)
  {
    id v3 = accessibilityLocalizedString(*(&off_8318 + v1));
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue(v3);
  }

  else
  {
    uint64_t v2 = &stru_89D0;
  }

  return v2;
}

LABEL_16:
  return v6;
}

id objc_msgSend_performValidations_withPreValidationHandler_postValidationHandler_safeCategoryInstallationHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:");
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}