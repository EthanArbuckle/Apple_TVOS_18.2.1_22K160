void sub_5158( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}
}

id accessibilityLocalizedString(void *a1)
{
  id v2 = a1;
  v3 = (void *)accessibilityLocalizedString_axBundle;
  if (accessibilityLocalizedString_axBundle
    || (v4 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___AXTVSystemPanelUIGlue, v1)),  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4),  v6 = (void *)accessibilityLocalizedString_axBundle,  accessibilityLocalizedString_axBundle = v5,  v6,  (v3 = (void *)accessibilityLocalizedString_axBundle) != 0LL))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:v2 value:&stru_8598 table:@"Accessibility"]);
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

LABEL_66:
    abort();
  }

  v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue( -[TVSPRendererHostingCollectionViewCellAccessibility _accessibilityRenderer]( self,  "_accessibilityRenderer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet accessibilityLabel](v7, "accessibilityLabel"));
LABEL_65:

  return v8;
}

LABEL_14:
  v24 = 0LL;
LABEL_19:

  return v24;
}

LABEL_8:
  v15 = v12;
  v16 = (NSUInteger)v14;
  result.length = v16;
  result.location = v15;
  return result;
}

id objc_msgSend_performValidations_withPreValidationHandler_postValidationHandler_safeCategoryInstallationHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:");
}

id objc_msgSend_validateProtocol_hasMethod_isInstanceMethod_isRequired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateProtocol:hasMethod:isInstanceMethod:isRequired:");
}