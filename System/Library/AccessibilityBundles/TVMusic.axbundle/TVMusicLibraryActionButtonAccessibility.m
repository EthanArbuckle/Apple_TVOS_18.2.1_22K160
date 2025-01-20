@interface TVMusicLibraryActionButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityParentForFindingScrollParent;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (unint64_t)accessibilityTraits;
@end

@implementation TVMusicLibraryActionButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVMusicLibraryActionButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TVCollectionView"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicLibraryActionButton",  @"title",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicLibraryActionButton",  @"text",  "@",  0);
  [v3 validateClass:@"TVMusicLibraryActionButton" hasInstanceVariable:@"_circular" withType:"B"];
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
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryActionButtonAccessibility accessibilityUserDefinedLabel]( self,  "accessibilityUserDefinedLabel"));
  if (![v3 length])
  {
    char v19 = 0;
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryActionButtonAccessibility safeValueForKey:](self, "safeValueForKey:", @"title"));
    uint64_t v7 = __UIAccessibilityCastAsClass(v5, v6, 1LL, &v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (v19
      || (char v18 = 0,
          uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString, v9),
          v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryActionButtonAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"text")),  uint64_t v12 = __UIAccessibilityCastAsClass(v10, v11, 1LL, &v18),  v13 = (void *)objc_claimAutoreleasedReturnValue(v12),  v11,  v18))
    {
      abort();
    }

    if ([v8 length] || objc_msgSend(v13, "length"))
    {
      uint64_t v14 = __UIAXStringForVariables(v8);
      uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);

      id v3 = (void *)v15;
    }
  }

  if (![v3 length])
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue( -[TVMusicLibraryActionButtonAccessibility _accessibilityValueForKey:]( self,  "_accessibilityValueForKey:",  @"AX_TVMusicLibraryActionButton_FallbackLabelKey"));

    id v3 = (void *)v16;
  }

  return v3;
}

- (id)accessibilityPath
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryActionButtonAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"_circular"));
  unsigned int v4 = [v3 BOOLValue];

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryActionButtonAccessibility _accessibilityCirclePathBasedOnBoundsWidth]( self,  "_accessibilityCirclePathBasedOnBoundsWidth"));
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___TVMusicLibraryActionButtonAccessibility;
    id v6 = -[TVMusicLibraryActionButtonAccessibility accessibilityPath](&v8, "accessibilityPath");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  return v5;
}

- (id)_accessibilityParentForFindingScrollParent
{
  char v18 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UIView, a2);
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVMusicLibraryActionButtonAccessibility;
  id v4 = -[TVMusicLibraryActionButtonAccessibility _accessibilityParentForFindingScrollParent]( &v17,  "_accessibilityParentForFindingScrollParent");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = __UIAccessibilityCastAsClass(v3, v5, 1LL, &v18);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v18
    || (char v18 = 0,
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___UIView, v8),
        id v10 = -[TVMusicLibraryActionButtonAccessibility _accessibilityAncestorIsKindOf:]( self,  "_accessibilityAncestorIsKindOf:",  AXSafeClassFromString(@"TVCollectionView")),  v11 = (void *)objc_claimAutoreleasedReturnValue(v10),  v12 = __UIAccessibilityCastAsClass(v9, v11, 1LL, &v18),  v13 = (void *)objc_claimAutoreleasedReturnValue(v12),  v11,  v18))
  {
    abort();
  }

  if (v13) {
    id v14 = (id)objc_claimAutoreleasedReturnValue([v13 superview]);
  }
  else {
    id v14 = v7;
  }
  uint64_t v15 = v14;

  return v15;
}

@end