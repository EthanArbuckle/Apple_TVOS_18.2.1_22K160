@interface _TVFullScreenBrowserViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldAttemptScrollToFrameOnParentView;
- (_TVFullScreenBrowserViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation _TVFullScreenBrowserViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVFullScreenBrowserView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_TVFullScreenBrowserView" hasProperty:@"collectionView" withType:"@"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"_TVFullScreenBrowserView",  @"initWithFrame:",  "@",  "{CGRect={CGPoint=dd}{CGSize=dd}}",  0);
}

- (BOOL)_accessibilityShouldAttemptScrollToFrameOnParentView
{
  return 0;
}

- (_TVFullScreenBrowserViewAccessibility)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____TVFullScreenBrowserViewAccessibility;
  id v3 = -[_TVFullScreenBrowserViewAccessibility initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3) {
    -[_TVFullScreenBrowserViewAccessibility _accessibilityLoadAccessibilityInformation]( v3,  "_accessibilityLoadAccessibilityInformation");
  }
  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____TVFullScreenBrowserViewAccessibility;
  -[_TVFullScreenBrowserViewAccessibility _accessibilityLoadAccessibilityInformation]( &v4,  "_accessibilityLoadAccessibilityInformation");
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[_TVFullScreenBrowserViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"collectionView"));
  [v3 _accessibilitySetScrollingEnabled:0];
}

@end