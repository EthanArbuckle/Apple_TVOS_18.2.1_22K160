@interface PBProcessManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)openApplication:(id)a3 launchURL:(id)a4 options:(id)a5 suspended:(BOOL)a6 completion:(id)a7;
@end

@implementation PBProcessManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBProcessManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)openApplication:(id)a3 launchURL:(id)a4 options:(id)a5 suspended:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = __88__PBProcessManagerAccessibility_openApplication_launchURL_options_suspended_completion___block_invoke;
  v18[3] = &unk_8310;
  id v19 = a7;
  id v12 = v19;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_retainBlock(v18);
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PBProcessManagerAccessibility;
  -[PBProcessManagerAccessibility openApplication:launchURL:options:suspended:completion:]( &v17,  "openApplication:launchURL:options:suspended:completion:",  v15,  v14,  v13,  v7,  v16);
}

void __88__PBProcessManagerAccessibility_openApplication_launchURL_options_suspended_completion___block_invoke( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0LL);
}

@end