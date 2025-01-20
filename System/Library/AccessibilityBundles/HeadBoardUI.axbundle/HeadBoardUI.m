}

id accessibilityLocalizedString(void *a1)
{
  id v1 = a1;
  v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___AXHeadBoardUIGlue, v2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v4) {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v1 value:&stru_4450 table:@"Accessibility"]);
  }
  else {
    v6 = 0LL;
  }

  return v6;
}

id appCellGridString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  LOBYTE(v15) = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 safeValueForKey:@"layout"]);
  uint64_t v6 = __UIAccessibilitySafeClass(@"HBAppGridLayout", v5, 1LL, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if ((_BYTE)v15) {
    abort();
  }
  v8 = 0LL;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0LL;
  if (v4 && v7)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = __appCellGridString_block_invoke;
    v11[3] = &unk_4250;
    id v12 = v7;
    id v13 = v4;
    v14 = &v15;
    AXPerformSafeBlock(v11);

    v8 = (void *)v16[5];
  }

  id v9 = v8;
  _Block_object_dispose(&v15, 8);

  return v9;
}

void sub_2D34( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void __appCellGridString_block_invoke(uint64_t a1)
{
  uint64_t v2 = AXFormatInteger((char *)[*(id *)(a1 + 32) rowFromIndexPath:*(void *)(a1 + 40)] + 1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = AXFormatInteger((char *)[*(id *)(a1 + 32) colFromIndexPath:*(void *)(a1 + 40)] + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = accessibilityLocalizedString(@"row.column.description");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v3, v5));

  id v9 = accessibilityLocalizedString(@"row.column.description.abbreviated");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v10,  v3,  v5));

  id v12 = objc_alloc(&OBJC_CLASS___NSAttributedString);
  uint64_t v17 = UIAccessibilityTokenBrailleOverride;
  v18 = v11;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
  v14 = -[NSAttributedString initWithString:attributes:](v12, "initWithString:attributes:", v8, v13);
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8LL);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

id objc_msgSend_performValidations_withPreValidationHandler_postValidationHandler_safeCategoryInstallationHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:");
}

id objc_msgSend_validateClass_isKindOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateClass:isKindOfClass:");
}