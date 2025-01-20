@interface PBSAccessibilitySettingsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_showAlertForDisablingSwitchControl;
- (void)setSwitchControlEnabled:(BOOL)a3;
@end

@implementation PBSAccessibilitySettingsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBSAccessibilitySettings";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"PBSAccessibilitySettings",  @"switchControlEnabled",  "B",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"PBSAccessibilitySettings",  @"setSwitchControlEnabled:",  "v",  "B",  0);
  [v3 validateClass:@"PBDialogManager"];
  objc_msgSend( v3,  "validateClass:hasClassMethod:withFullSignature:",  @"PBDialogManager",  @"sharedInstance",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"PBDialogManager",  @"presentDialogWithContext:options:completion:",  "v",  "@",  "@",  "@?",  0);
  [v3 validateClass:@"PBDialogContext"];
  objc_msgSend( v3,  "validateClass:hasClassMethod:withFullSignature:",  @"PBDialogContext",  @"contextWithViewController:",  "@",  "@",  0);
}

- (void)setSwitchControlEnabled:(BOOL)a3
{
  if (a3)
  {
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___PBSAccessibilitySettingsAccessibility;
    -[PBSAccessibilitySettingsAccessibility setSwitchControlEnabled:](&v3, "setSwitchControlEnabled:", 1LL);
  }

  else
  {
    -[PBSAccessibilitySettingsAccessibility _showAlertForDisablingSwitchControl]( self,  "_showAlertForDisablingSwitchControl");
  }

- (void)_showAlertForDisablingSwitchControl
{
  uint64_t v3 = AXUILocalizedStringForKey(@"TURN_OFF_SC_ALERT_TITLE", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v6 = AXUILocalizedStringForKey(@"TURN_OFF_SC_ALERT_MESSAGE", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v4,  v7,  1LL));

  uint64_t v10 = AXUILocalizedStringForKey(@"TURN_OFF_SC_ALERT_CONFIRM", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = __76__PBSAccessibilitySettingsAccessibility__showAlertForDisablingSwitchControl__block_invoke;
  v20[3] = &unk_82C0;
  v20[4] = self;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11,  0LL,  v20));

  uint64_t v14 = AXUILocalizedStringForKey(@"TURN_OFF_SC_ALERT_CANCEL", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v15,  1LL,  0LL));

  [v8 addAction:v12];
  [v8 addAction:v16];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = __76__PBSAccessibilitySettingsAccessibility__showAlertForDisablingSwitchControl__block_invoke_2;
  v18[3] = &unk_82E8;
  id v19 = v8;
  id v17 = v8;
  AXPerformSafeBlock(v18);
}

id __76__PBSAccessibilitySettingsAccessibility__showAlertForDisablingSwitchControl__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)&OBJC_CLASS___PBSAccessibilitySettingsAccessibility;
  return objc_msgSendSuper2(&v2, "setSwitchControlEnabled:", 0);
}

void __76__PBSAccessibilitySettingsAccessibility__showAlertForDisablingSwitchControl__block_invoke_2( uint64_t a1)
{
  v7 = @"PBDialogOptionPresentImmediatelyKey";
  v8 = &__kCFBooleanTrue;
  objc_super v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  id v3 = [(id)AXSafeClassFromString(@"PBDialogContext") contextWithViewController:*(void *)(a1 + 32)];
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [(id)AXSafeClassFromString(@"PBDialogManager") sharedInstance];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v6 presentDialogWithContext:v4 options:v2 completion:0];
}

@end