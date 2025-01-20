@interface TVMusicLibraryCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityFrameDelegate;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (unint64_t)accessibilityTraits;
@end

@implementation TVMusicLibraryCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVMusicLibraryCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_UIFloatingContentView"];
  [v3 validateClass:@"TVMusicLibraryCollectionViewCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"TVMusicLibraryCollectionViewCell" hasInstanceVariable:@"_subTitleLabel" withType:"UILabel"];
  [v3 validateClass:@"TVMusicLibraryCollectionViewCell" hasInstanceVariable:@"_imageView" withType:"UIImageView"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicLibraryCollectionViewCell",  @"imageShape",  "q",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (id)accessibilityLabel
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessibilityLabel]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"_subTitleLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 accessibilityLabel]);
  uint64_t v6 = __UIAXStringForVariables(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)accessibilityPath
{
  if (-[TVMusicLibraryCollectionViewCellAccessibility safeUnsignedIntegerForKey:]( self,  "safeUnsignedIntegerForKey:",  @"imageShape") == (char *)&dword_0 + 3)
  {
    char v22 = 0;
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___UIView, v3);
    uint64_t v5 = __UIAccessibilityCastAsClass(v4, self, 1LL, &v22);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if (v22) {
      abort();
    }
    v7 = v6;
    [v6 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    AX_CGRectGetCenter(v9, v11, v13, v15);
    v16 = (UIBezierPath *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:",  1LL));
    v17 = UIAccessibilityConvertPathToScreenCoordinates(v16, (UIView *)self);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  }

  else
  {
    v21.receiver = self;
    v21.super_class = (Class)&OBJC_CLASS___TVMusicLibraryCollectionViewCellAccessibility;
    id v19 = -[TVMusicLibraryCollectionViewCellAccessibility accessibilityPath](&v21, "accessibilityPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v19);
  }

  return v18;
}

- (id)_accessibilityFrameDelegate
{
  if (-[TVMusicLibraryCollectionViewCellAccessibility safeUnsignedIntegerForKey:]( self,  "safeUnsignedIntegerForKey:",  @"imageShape") == (char *)&dword_0 + 3) {
    return 0LL;
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"_imageView"));
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___TVMusicLibraryCollectionViewCellAccessibility;
    id v7 = -[TVMusicLibraryCollectionViewCellAccessibility _accessibilityFrameDelegate]( &v9,  "_accessibilityFrameDelegate");
    id v6 = (id)objc_claimAutoreleasedReturnValue(v7);
  }

  double v8 = v6;

  return v8;
}

@end