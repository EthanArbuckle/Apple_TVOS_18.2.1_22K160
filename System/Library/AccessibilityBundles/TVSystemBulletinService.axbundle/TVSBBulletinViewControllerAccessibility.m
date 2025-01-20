@interface TVSBBulletinViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)bulletinServiceBeginPresentationWithBulletin:(id)a3;
@end

@implementation TVSBBulletinViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSBBulletinViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PBSBulletin"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSBBulletinViewController",  @"bulletinServiceBeginPresentationWithBulletin:",  "v",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"PBSBulletin",  @"message",  "@",  0);
}

- (void)bulletinServiceBeginPresentationWithBulletin:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVSBBulletinViewControllerAccessibility;
  -[TVSBBulletinViewControllerAccessibility bulletinServiceBeginPresentationWithBulletin:]( &v18,  "bulletinServiceBeginPresentationWithBulletin:",  v4);
  char v17 = 0;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 safeValueForKey:@"message"]);
  uint64_t v8 = __UIAccessibilityCastAsClass(v6, v7, 1LL, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v17) {
    abort();
  }
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PBSSystemBulletinTitleKey"]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PBSSystemBulletinMessageKey"]);
  if (!(v10 | v11)) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/ATVAccessibility/bundles/TVSystemBulletinServiceAccessibility/source/TVSBBul letinViewControllerAccessibility.m",  43LL,  "-[TVSBBulletinViewControllerAccessibility bulletinServiceBeginPresentationWithBulletin:]",  @"Expected bulletin payload to have a title or a message: %@");
  }
  uint64_t v12 = __UIAXStringForVariables(v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if ([v13 length])
  {
    id v14 = accessibilityLocalizedString(@"alert.notification");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v15, v13));
    UIAccessibilityATVPostAnnouncementNotification(v16, kAXAnnouncementTypeAlertSound, 1LL);
  }
}

@end