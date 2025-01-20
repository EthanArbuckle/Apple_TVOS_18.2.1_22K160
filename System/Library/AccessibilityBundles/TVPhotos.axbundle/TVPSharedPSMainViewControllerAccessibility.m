@interface TVPSharedPSMainViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilitySharedAlbumHeaderView;
- (id)_accessibilitySubscribedAlbumHeaderView;
- (id)accessibilityHeaderElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_layoutSharedAlbumsView;
@end

@implementation TVPSharedPSMainViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVPSharedPSMainViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPSharedPSMainViewController",  @"sharedAlbumHeaderView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPSharedPSMainViewController",  @"subscribedAlbumHeaderView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPSharedPSMainViewController",  @"_layoutSharedAlbumsView",  "v",  0);
}

- (id)accessibilityHeaderElements
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXATVUtils sharedInstance](&OBJC_CLASS___AXATVUtils, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentFocusedView]);

  id v6 = objc_msgSend(v4, "_accessibilityAncestorIsKindOf:", objc_opt_class(UICollectionView, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if ((unint64_t)[v7 tag] > 1) {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( -[TVPSharedPSMainViewControllerAccessibility _accessibilitySubscribedAlbumHeaderView]( self,  "_accessibilitySubscribedAlbumHeaderView"));
  }
  else {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( -[TVPSharedPSMainViewControllerAccessibility _accessibilitySharedAlbumHeaderView]( self,  "_accessibilitySharedAlbumHeaderView"));
  }
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  1LL,  v8));

  return v10;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPSharedPSMainViewControllerAccessibility;
  -[TVPSharedPSMainViewControllerAccessibility _accessibilityLoadAccessibilityInformation]( &v6,  "_accessibilityLoadAccessibilityInformation");
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedPSMainViewControllerAccessibility _accessibilitySharedAlbumHeaderView]( self,  "_accessibilitySharedAlbumHeaderView"));
  UIAccessibilityTraits v4 = UIAccessibilityTraitHeader;
  [v3 setAccessibilityTraits:UIAccessibilityTraitHeader];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedPSMainViewControllerAccessibility _accessibilitySubscribedAlbumHeaderView]( self,  "_accessibilitySubscribedAlbumHeaderView"));
  [v5 setAccessibilityTraits:v4];
}

- (id)_accessibilitySharedAlbumHeaderView
{
  char v11 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UIVisualEffectView, a2);
  UIAccessibilityTraits v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedPSMainViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"sharedAlbumHeaderView"));
  uint64_t v5 = __UIAccessibilityCastAsClass(v3, v4, 1LL, &v11);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v11) {
    abort();
  }
  id v8 = objc_msgSend(v6, "_accessibilityDescendantOfType:", objc_opt_class(UILabel, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (id)_accessibilitySubscribedAlbumHeaderView
{
  char v11 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UIVisualEffectView, a2);
  UIAccessibilityTraits v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedPSMainViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"subscribedAlbumHeaderView"));
  uint64_t v5 = __UIAccessibilityCastAsClass(v3, v4, 1LL, &v11);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v11) {
    abort();
  }
  id v8 = objc_msgSend(v6, "_accessibilityDescendantOfType:", objc_opt_class(UILabel, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (void)_layoutSharedAlbumsView
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVPSharedPSMainViewControllerAccessibility;
  -[TVPSharedPSMainViewControllerAccessibility _layoutSharedAlbumsView](&v3, "_layoutSharedAlbumsView");
  -[TVPSharedPSMainViewControllerAccessibility _accessibilityLoadAccessibilityInformation]( self,  "_accessibilityLoadAccessibilityInformation");
}

@end