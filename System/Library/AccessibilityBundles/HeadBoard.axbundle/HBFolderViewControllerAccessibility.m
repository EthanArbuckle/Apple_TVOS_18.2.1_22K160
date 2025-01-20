@interface HBFolderViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHeaderElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_close;
- (void)prepareZoomLaunchAnimationWithCellConfiguration:(id)a3 initialPosition:(CGPoint)a4 scale:(double)a5;
- (void)viewDidLoad;
@end

@implementation HBFolderViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HBFolderViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HBFolderViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBFolderViewController",  @"prepareZoomLaunchAnimationWithCellConfiguration: initialPosition: scale:",  "v",  "@",  "{CGPoint=dd}",  "d",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBFolderViewController",  @"_close",  "v",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBFolderViewController",  @"folder",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBFolderViewController",  @"renameFolderTextField",  "@",  0);
  [v3 validateClass:@"HBFolder"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBFolder",  @"displayName",  "@",  0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___HBFolderViewControllerAccessibility;
  -[HBFolderViewControllerAccessibility _accessibilityLoadAccessibilityInformation]( &v10,  "_accessibilityLoadAccessibilityInformation");
  char v9 = 0;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UITextField, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[HBFolderViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"renameFolderTextField"));
  uint64_t v6 = __UIAccessibilityCastAsClass(v4, v5, 1LL, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v9) {
    abort();
  }
  unint64_t v8 = (unint64_t)[v7 accessibilityTraits];
  [v7 setAccessibilityTraits:UIAccessibilityTraitHeader | v8];
}

- (id)accessibilityHeaderElements
{
  char v9 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UITextField, a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[HBFolderViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"renameFolderTextField"));
  uint64_t v5 = __UIAccessibilityCastAsClass(v3, v4, 1LL, &v9);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v9) {
    abort();
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  1LL,  v6));

  return v7;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HBFolderViewControllerAccessibility;
  -[HBFolderViewControllerAccessibility viewDidLoad](&v3, "viewDidLoad");
  -[HBFolderViewControllerAccessibility _accessibilityLoadAccessibilityInformation]( self,  "_accessibilityLoadAccessibilityInformation");
}

- (void)prepareZoomLaunchAnimationWithCellConfiguration:(id)a3 initialPosition:(CGPoint)a4 scale:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[HBFolderViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", @"folder"));
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 safeValueForKey:@"displayName"]);

  if (v11) {
    v12 = (__CFString *)v11;
  }
  else {
    v12 = &stru_D0E8;
  }
  id v13 = accessibilityLocalizedString(@"opening.folder.announcement");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v14, v12));

  UIAccessibilityPostNotification(0x411u, 0LL);
  UIAccessibilitySpeakAndDoNotBeInterrupted(v15);
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___HBFolderViewControllerAccessibility;
  -[HBFolderViewControllerAccessibility prepareZoomLaunchAnimationWithCellConfiguration:initialPosition:scale:]( &v16,  "prepareZoomLaunchAnimationWithCellConfiguration:initialPosition:scale:",  v9,  x,  y,  a5);
}

- (void)_close
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[HBFolderViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", @"folder"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 safeValueForKey:@"displayName"]);

  if (v5) {
    uint64_t v6 = (__CFString *)v5;
  }
  else {
    uint64_t v6 = &stru_D0E8;
  }
  id v7 = accessibilityLocalizedString(@"closing.folder.announcement");
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v6));

  UIAccessibilityPostNotification(0x411u, 0LL);
  *(void *)&double v10 = UIAccessibilitySpeakAndDoNotBeInterrupted(v9).n128_u64[0];
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___HBFolderViewControllerAccessibility;
  -[HBFolderViewControllerAccessibility _close](&v11, "_close", v10);
}

void __45__HBFolderViewControllerAccessibility__close__block_invoke(id a1)
{
}

@end