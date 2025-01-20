@interface TVSettingsLanguageViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
@end

@implementation TVSettingsLanguageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSettingsLanguageViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSettingsLanguageViewController",  @"tableView: cellForRowAtIndexPath:",  "@",  "@",  0);
  [v3 validateClass:@"TSKTableViewSubtitleTextCell"];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  char v30 = 0;
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  id v29 = 0LL;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = __81__TVSettingsLanguageViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke;
  v21[3] = &unk_81D0;
  v23 = &v24;
  v21[4] = self;
  id v7 = a4;
  id v22 = v7;
  AXPerformSafeBlock(v21);
  v8 = v22;
  id v9 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  uint64_t v10 = __UIAccessibilitySafeClass(@"TSKSettingItem", v9, 1LL, &v30);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v30) {
    abort();
  }
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVSettingsLanguageViewControllerAccessibility;
  id v12 = -[TVSettingsLanguageViewControllerAccessibility tableView:cellForRowAtIndexPath:]( &v20,  "tableView:cellForRowAtIndexPath:",  v6,  v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = AXSafeClassFromString(@"TSKTableViewSubtitleTextCell");
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v11 representedObject]);
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v13 textLabel]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 accessibilityLabel]);
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[AXAttributedString axAttributedStringWithString:]( &OBJC_CLASS___AXAttributedString,  "axAttributedStringWithString:",  v17));

      [v18 setAttribute:v15 forKey:UIAccessibilityTokenOverrideLanguage];
      [v13 setAccessibilityLabel:v18];
    }
  }

  return v13;
}

void __81__TVSettingsLanguageViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke( uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) settingItemAtIndexPath:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end