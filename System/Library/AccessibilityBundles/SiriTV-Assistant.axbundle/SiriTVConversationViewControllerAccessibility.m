@interface SiriTVConversationViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SiriTVConversationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriTV.ConversationViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SiriTVConversationViewControllerAccessibility;
  -[SiriTVConversationViewControllerAccessibility viewDidAppear:](&v7, "viewDidAppear:", a3);
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __63__SiriTVConversationViewControllerAccessibility_viewDidAppear___block_invoke;
  v4[3] = &unk_4228;
  objc_copyWeak(&v5, &location);
  AXPerformBlockOnMainThreadAfterDelay(v4, 0.3);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __63__SiriTVConversationViewControllerAccessibility_viewDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v9 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UIViewController, v2);
  uint64_t v4 = __UIAccessibilityCastAsClass(v3, WeakRetained, 1LL, &v9);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v9) {
    abort();
  }
  v6 = v5;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 accessibilityLabel]);

  if ([v8 length]) {
    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v8);
  }
}

@end