@interface TVOneUpPresentationImplementationDelegateAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)oneUpPresentation:(id)a3 startAnimated:(BOOL)a4 interactiveMode:(int64_t)a5;
- (void)photoLibraryOneUpControllerWillPop:(id)a3;
@end

@implementation TVOneUpPresentationImplementationDelegateAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVOneUpPresentationImplementationDelegate";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (BOOL)oneUpPresentation:(id)a3 startAnimated:(BOOL)a4 interactiveMode:(int64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = accessibilityLocalizedString(@"showing.fullscreen.photo");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  UIAccessibilitySpeak();

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVOneUpPresentationImplementationDelegateAccessibility;
  LOBYTE(a5) = -[TVOneUpPresentationImplementationDelegateAccessibility oneUpPresentation:startAnimated:interactiveMode:]( &v12,  "oneUpPresentation:startAnimated:interactiveMode:",  v8,  v6,  a5);

  return a5;
}

- (void)photoLibraryOneUpControllerWillPop:(id)a3
{
  id v4 = a3;
  id v5 = accessibilityLocalizedString(@"dismissing.fullscreen.photo");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  UIAccessibilitySpeak();

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVOneUpPresentationImplementationDelegateAccessibility;
  -[TVOneUpPresentationImplementationDelegateAccessibility photoLibraryOneUpControllerWillPop:]( &v7,  "photoLibraryOneUpControllerWillPop:",  v4);
}

@end