@interface TVPMemoriesTabCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (TVPMemoriesTabCollectionViewCellAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TVPMemoriesTabCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVPMemoriesTabCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPMemoriesTabCollectionViewCell",  @"memoryTitleLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPMemoriesTabCollectionViewCell",  @"memorySubtitleLabel",  "@",  0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabCollectionViewCellAccessibility;
  -[TVPMemoriesTabCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation]( &v18,  "_accessibilityLoadAccessibilityInformation");
  LOBYTE(location) = 0;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UIView, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVPMemoriesTabCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"memoryTitleLabel"));
  uint64_t v6 = __UIAccessibilityCastAsClass(v4, v5, 1LL, &location);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if ((_BYTE)location
    || (LOBYTE(location) = 0,
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___UIView, v8),
        v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVPMemoriesTabCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"memorySubtitleLabel")),  uint64_t v11 = __UIAccessibilityCastAsClass(v9, v10, 1LL, &location),  v12 = (void *)objc_claimAutoreleasedReturnValue(v11),  v10,  (_BYTE)location))
  {
    abort();
  }

  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __91__TVPMemoriesTabCollectionViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v15[3] = &unk_8230;
  objc_copyWeak(&v16, &location);
  [v7 _setAccessibilityLabelBlock:v15];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = __91__TVPMemoriesTabCollectionViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v13[3] = &unk_8230;
  objc_copyWeak(&v14, &location);
  [v12 _setAccessibilityLabelBlock:v13];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

id __91__TVPMemoriesTabCollectionViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke( uint64_t a1,  uint64_t a2)
{
  char v11 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UILabel, a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained safeValueForKey:@"memoryTitleLabel"]);
  uint64_t v6 = __UIAccessibilityCastAsClass(v3, v5, 1LL, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v11) {
    abort();
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 text]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 lowercaseString]);

  return v9;
}

id __91__TVPMemoriesTabCollectionViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2( uint64_t a1,  uint64_t a2)
{
  char v11 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UILabel, a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained safeValueForKey:@"memorySubtitleLabel"]);
  uint64_t v6 = __UIAccessibilityCastAsClass(v3, v5, 1LL, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v11) {
    abort();
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 text]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 lowercaseString]);

  return v9;
}

- (TVPMemoriesTabCollectionViewCellAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabCollectionViewCellAccessibility;
  uint64_t v3 =  -[TVPMemoriesTabCollectionViewCellAccessibility initWithFrame:]( &v5,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  -[TVPMemoriesTabCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation]( v3,  "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end