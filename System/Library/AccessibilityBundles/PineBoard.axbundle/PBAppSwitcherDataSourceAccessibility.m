@interface PBAppSwitcherDataSourceAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)handleKillRequestForItem:(id)a3;
@end

@implementation PBAppSwitcherDataSourceAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBAppSwitcherDataSource";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"PBAppSwitcherDataSource",  @"handleKillRequestForItem:",  "v",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"PBAppSwitcherItem",  @"displayName",  "@",  0);
}

- (void)handleKillRequestForItem:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PBAppSwitcherDataSourceAccessibility;
  -[PBAppSwitcherDataSourceAccessibility handleKillRequestForItem:](&v14, "handleKillRequestForItem:", v4);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    char v13 = 0;
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 safeValueForKey:@"displayName"]);
    uint64_t v8 = __UIAccessibilityCastAsClass(v6, v7, 1LL, &v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if (v13) {
      abort();
    }
    if ([v9 length])
    {
      id v10 = accessibilityLocalizedString(@"closing.app.announcement");
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v11, v9));

      UIAccessibilitySpeakAndDoNotBeInterrupted(v12);
    }
  }
}

@end