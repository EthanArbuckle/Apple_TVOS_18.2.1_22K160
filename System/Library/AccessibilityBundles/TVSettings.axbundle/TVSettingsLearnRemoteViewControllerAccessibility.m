@interface TVSettingsLearnRemoteViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)irLearningManager:(id)a3 didCompleteLearningAction:(int)a4 withResult:(BOOL)a5 error:(id)a6;
- (void)irLearningManager:(id)a3 didFailToStartLearningWithError:(id)a4;
- (void)irLearningManager:(id)a3 didFinishLearningAction:(int)a4;
- (void)irLearningManager:(id)a3 didLearnAction:(int)a4 withProgress:(double)a5;
- (void)irLearningManager:(id)a3 didSaveLearnedActions:(id)a4 forDeviceWithUUID:(id)a5;
- (void)irLearningManager:(id)a3 willStartLearningAction:(int)a4;
- (void)irLearningManagerDidCancel:(id)a3;
@end

@implementation TVSettingsLearnRemoteViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSettingsLearnRemoteViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSettingsLearnRemoteViewController",  @"irLearningManager: didFailToStartLearningWithError:",  "v",  "@",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSettingsLearnRemoteViewController",  @"irLearningManager: didSaveLearnedActions: forDeviceWithUUID:",  "v",  "@",  "@",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSettingsLearnRemoteViewController",  @"irLearningManagerDidCancel:",  "v",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSettingsLearnRemoteViewController",  @"irLearningManager: willStartLearningAction:",  "v",  "@",  "i",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSettingsLearnRemoteViewController",  @"irLearningManager: didLearnAction: withProgress:",  "v",  "@",  "i",  "d",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSettingsLearnRemoteViewController",  @"irLearningManager: didCompleteLearningAction: withResult: error:",  "v",  "@",  "i",  "B",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSettingsLearnRemoteViewController",  @"irLearningManager: didFinishLearningAction:",  "v",  "@",  "i",  0);
}

- (void)irLearningManager:(id)a3 didFailToStartLearningWithError:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __102__TVSettingsLearnRemoteViewControllerAccessibility_irLearningManager_didFailToStartLearningWithError___block_invoke;
  v8[3] = &unk_8260;
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  id v6 = v10;
  id v7 = v9;
  AXPerformSafeBlock(v8);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0LL);
}

id __102__TVSettingsLearnRemoteViewControllerAccessibility_irLearningManager_didFailToStartLearningWithError___block_invoke( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 48);
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsLearnRemoteViewControllerAccessibility;
  return objc_msgSendSuper2(&v4, "irLearningManager:didFailToStartLearningWithError:", v2, v1);
}

- (void)irLearningManager:(id)a3 didSaveLearnedActions:(id)a4 forDeviceWithUUID:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __110__TVSettingsLearnRemoteViewControllerAccessibility_irLearningManager_didSaveLearnedActions_forDeviceWithUUID___block_invoke;
  v11[3] = &unk_8288;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = self;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  AXPerformSafeBlock(v11);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0LL);
}

id __110__TVSettingsLearnRemoteViewControllerAccessibility_irLearningManager_didSaveLearnedActions_forDeviceWithUUID___block_invoke( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v5.receiver = *(id *)(a1 + 56);
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsLearnRemoteViewControllerAccessibility;
  return objc_msgSendSuper2(&v5, "irLearningManager:didSaveLearnedActions:forDeviceWithUUID:", v1, v2, v3);
}

- (void)irLearningManagerDidCancel:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __79__TVSettingsLearnRemoteViewControllerAccessibility_irLearningManagerDidCancel___block_invoke;
  v5[3] = &unk_82B0;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  AXPerformSafeBlock(v5);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0LL);
}

id __79__TVSettingsLearnRemoteViewControllerAccessibility_irLearningManagerDidCancel___block_invoke( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsLearnRemoteViewControllerAccessibility;
  return objc_msgSendSuper2(&v3, "irLearningManagerDidCancel:", v1);
}

- (void)irLearningManager:(id)a3 willStartLearningAction:(int)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __94__TVSettingsLearnRemoteViewControllerAccessibility_irLearningManager_willStartLearningAction___block_invoke;
  v6[3] = &unk_82D8;
  int v9 = a4;
  id v7 = a3;
  id v8 = self;
  id v5 = v7;
  AXPerformSafeBlock(v6);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0LL);
}

id __94__TVSettingsLearnRemoteViewControllerAccessibility_irLearningManager_willStartLearningAction___block_invoke( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(unsigned int *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsLearnRemoteViewControllerAccessibility;
  return objc_msgSendSuper2(&v4, "irLearningManager:willStartLearningAction:", v1, v2);
}

- (void)irLearningManager:(id)a3 didLearnAction:(int)a4 withProgress:(double)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __98__TVSettingsLearnRemoteViewControllerAccessibility_irLearningManager_didLearnAction_withProgress___block_invoke;
  v7[3] = &unk_8300;
  int v11 = a4;
  double v10 = a5;
  id v8 = a3;
  int v9 = self;
  id v6 = v8;
  AXPerformSafeBlock(v7);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0LL);
}

id __98__TVSettingsLearnRemoteViewControllerAccessibility_irLearningManager_didLearnAction_withProgress___block_invoke( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(unsigned int *)(a1 + 56);
  double v3 = *(double *)(a1 + 48);
  v5.receiver = *(id *)(a1 + 40);
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsLearnRemoteViewControllerAccessibility;
  return objc_msgSendSuper2(&v5, "irLearningManager:didLearnAction:withProgress:", v1, v2, v3);
}

- (void)irLearningManager:(id)a3 didCompleteLearningAction:(int)a4 withResult:(BOOL)a5 error:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __113__TVSettingsLearnRemoteViewControllerAccessibility_irLearningManager_didCompleteLearningAction_withResult_error___block_invoke;
  v10[3] = &unk_8328;
  int v14 = a4;
  BOOL v15 = a5;
  id v11 = a3;
  id v12 = a6;
  id v13 = self;
  id v8 = v12;
  id v9 = v11;
  AXPerformSafeBlock(v10);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0LL);
}

id __113__TVSettingsLearnRemoteViewControllerAccessibility_irLearningManager_didCompleteLearningAction_withResult_error___block_invoke( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(unsigned int *)(a1 + 56);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 60);
  uint64_t v4 = *(void *)(a1 + 32);
  v6.receiver = *(id *)(a1 + 48);
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsLearnRemoteViewControllerAccessibility;
  return objc_msgSendSuper2(&v6, "irLearningManager:didCompleteLearningAction:withResult:error:", v4, v2, v3, v1);
}

- (void)irLearningManager:(id)a3 didFinishLearningAction:(int)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __94__TVSettingsLearnRemoteViewControllerAccessibility_irLearningManager_didFinishLearningAction___block_invoke;
  v6[3] = &unk_82D8;
  int v9 = a4;
  id v7 = a3;
  id v8 = self;
  id v5 = v7;
  AXPerformSafeBlock(v6);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0LL);
}

id __94__TVSettingsLearnRemoteViewControllerAccessibility_irLearningManager_didFinishLearningAction___block_invoke( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(unsigned int *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsLearnRemoteViewControllerAccessibility;
  return objc_msgSendSuper2(&v4, "irLearningManager:didFinishLearningAction:", v1, v2);
}

@end